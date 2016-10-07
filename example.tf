// Configure the Google Cloud provider
provider "google" {
  credentials = "${file("account.json")}"
  project     = "modular-asset-145402"
  region      = "us-central1"
}

resource "google_compute_network" "default" {
  name                    = "example"
  auto_create_subnetworks = "false"
}

resource "google_compute_subnetwork" "default" {
  name          = "sub01"
  ip_cidr_range = "10.0.0.0/16"
  network       = "${google_compute_network.default.self_link}"
}

resource "google_compute_firewall" "default" {
  name    = "ssh"
  network = "${google_compute_network.default.name}"
  allow {
    protocol = "icmp"
  }
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
}

