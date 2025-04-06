variable "project_id" {}
variable "region" {
  default = "us-central1"
}
variable "credentials_file" {
  default = "~/terraform-key.json"
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
