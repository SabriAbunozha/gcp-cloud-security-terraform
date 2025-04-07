
# Root - minimal, calls modules and has shared resources like firewall rules

resource "google_compute_firewall" "allow_ssh" {
  name    = "allow-ssh"
  network = module.network.vpc_network_name
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  source_ranges = ["0.0.0.0/0"]
}
 // modules link
module "network" {
  source       = "./modules/network"
  vpc_name     = "secure-vpc"
  subnet_name  = "subnet-public"
  subnet_ip    = "10.0.0.0/24"
  region       = "us-central1"
}

module "iam" {
  source     = "./modules/iam"
  project_id = "secure-gcp-env"
}

module "compute" {
  source    = "./modules/compute"
  zone      = "us-central1-a"
  network   = module.network.vpc_network_id
  subnetwork = module.network.subnet_id
}

module "vpn" {
  source         = "./modules/vpn"
  peer_ip        = var.peer_ip
  shared_secret= var.shared_secret
  remote_subnet  = var.remote_subnet
  network        = module.network.vpc_network_id
  region         = var.region
}

