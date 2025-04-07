variable "vpc_name" {
  type        = string
  description = "Name of the VPC"
}

variable "subnet_name" {
  type        = string
  description = "Name of the Subnet"
}

variable "subnet_ip" {
  type        = string
  description = "CIDR range for the subnet"
}

variable "region" {
  type        = string
  description = "The GCP region to deploy the network"
}
