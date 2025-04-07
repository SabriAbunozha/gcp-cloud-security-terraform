variable "region" {}
variable "network" {}
variable "peer_ip" {
    description = "Public IP of the peer VPN gateway (simulated or real)"
    type = string
}
variable "shared_secret" {
  description = "Shared secret for VPN tunnel"
  type        = string
  sensitive = true
}
variable "remote_subnet" {
  description = "CIDR range of the remote network"
}
