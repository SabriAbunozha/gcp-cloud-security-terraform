variable "zone" {
  type        = string
  description = "The GCP zone to deploy the instances"
}

variable "network" {
  type        = string
  description = "VPC network to use for the instances"
}

variable "subnetwork" {
  type        = string
  description = "The subnet the instance will reside in"
}
