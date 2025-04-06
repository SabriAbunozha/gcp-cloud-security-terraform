output "vpc_name" {
  value = google_compute_network.secure_vpc.name
}

output "subnet_ip_range" {
  value = google_compute_subnetwork.secure_subnet.ip_cidr_range
}
