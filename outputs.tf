# Root-level outputs if needed
output "vpc_name" {
  value = module.network.vpc_network_name
}

output "subnet_ip_range" {
  value = module.network.subnet_ip_range
}
