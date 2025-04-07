output "vpc_network_id" {
  value = google_compute_network.secure_vpc.id
}

output "subnet_id" {
  value = google_compute_subnetwork.secure_subnet.id
}
output "vpc_network_name" {
  value = google_compute_network.vpc_network.name
}

output "subnet_ip_range" {
  value = google_compute_subnetwork.subnet_public.ip_cidr_range
}
