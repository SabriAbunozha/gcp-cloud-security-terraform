# Root-level variables (mostly for shared/global settings)

variable "project_id" {}
variable "region" {
  default = "us-central1"
}
variable "vpc_name" {
  default = "secure-vpc"
}
variable "subnet_name" {
  default = "secure-subnet"
}
variable "subnet_ip" {
  default = "10.10.0.0/24"
}
variable "peer_ip" {
  description = "Public IP of the peer VPN gateway"
  type        = string
}

variable "shared_secret" {
  description = "Shared secret for VPN tunnel"
  type        = string
  sensitive   = true
}

variable "remote_subnet" {
  description = "Remote subnet range (on-prem)"
  type        = string
}
