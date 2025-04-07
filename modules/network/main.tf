resource "google_compute_network" "secure_vpc" {
  name                    = var.vpc_name
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "secure_subnet" {
  name          = "secure-subnet"
  ip_cidr_range = "10.0.2.0/24"
  region        = var.region
  network       = google_compute_network.secure_vpc.id
}

resource "google_compute_router" "nat_router" {
  name    = "nat-router"
  region  = var.region
  network = google_compute_network.secure_vpc.id
}

resource "google_compute_router_nat" "cloud_nat" {
  name                               = "nat-config"
  router                             = google_compute_router.nat_router.name
  region                             = var.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
}
resource "google_compute_network" "vpc_network" {
  name = "secure-vpc-network"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet_public" {
  name          = "subnet-public"
  network       = google_compute_network.vpc_network.self_link
  region        = var.region
  ip_cidr_range = "10.0.0.0/24"
}

resource "google_compute_subnetwork" "subnet_private" {
  name          = "subnet-private"
  network       = google_compute_network.vpc_network.self_link
  region        = var.region
  ip_cidr_range = "10.0.1.0/24"
}
