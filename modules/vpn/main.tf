resource "google_compute_address" "vpn_static_ip" {
    name        = "vpn-static-ip"
    region      = var.region
}
resource "google_compute_vpn_gateway" "vpn_gateway" {
  name      = "vpn-gateway"
  region    = var.region
  network   = module.network.vpc_network_id
}

resource "google_compute_forwarding_rule" "vpn_esp_rule" {
  name        = "vpn-esp-rule"
  region      = var.region
  ip_protocol = "ESP"
  ip_address  = google_compute_address.vpn_static_ip.address
  target      = google_compute_vpn_gateway.vpn_gateway.self_link
}

resource "google_compute_forwarding_rule" "vpn_udp_500" {
  name        = "vpn-udp500"
  region      = var.region
  ip_protocol = "UDP"
  port_range  = "500"
  ip_address  = google_compute_address.vpn_static_ip.address
  target      = google_compute_vpn_gateway.vpn_gateway.self_link
}

resource "google_compute_forwarding_rule" "vpn_udp_4500" {
  name        = "vpn-udp4500"
  region      = var.region
  ip_protocol = "UDP"
  port_range  = "4500"
  ip_address  = google_compute_address.vpn_static_ip.address
  target      = google_compute_vpn_gateway.vpn_gateway.self_link
}

resource "google_compute_vpn_tunnel" "vpn_tunnel" {
  name                  = "vpn-tunnel"
  region                = var.region
  target_vpn_gateway    = google_compute_vpn_gateway.vpn_gateway.self_link
  peer_ip               = var.peer_ip
  shared_secret         = var.shared_secret
  ike_version = 2
  local_traffic_selector    = ["0.0.0.0/0"]
  remote_traffic_selector   = ["0.0.0.0/0"]
  depends_on = [
    google_compute_forwarding_rule.vpn_esp_rule,
    google_compute_forwarding_rule.vpn_udp_500,
    google_compute_forwarding_rule.vpn_udp_4500
  ]
}
resource "google_compute_route" "vpn_route" {
    name                = "vpn-route"
    network             = var.network
    dest_range          = var.remote_subnet
    next_hop_vpn_tunnel = google_compute_vpn_tunnel.vpn_tunnel.id
    priority            = 1000
  
}