resource "google_compute_instance" "bastion_host" {
  name         = "bastion-host"
  machine_type = "f1-micro"
  zone         = var.zone
  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-focal-v20210325"
    }
  }
  network_interface {
    network    = var.network
    subnetwork = var.subnetwork
    access_config {
      // for public IP
    }
  }
}

resource "google_compute_instance" "private_vm" {
  name         = "private-vm"
  machine_type = "f1-micro"
  zone         = var.zone
  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-focal-v20210325"
    }
  }
  network_interface {
    network    = var.network
    subnetwork = var.subnetwork
  }
}
