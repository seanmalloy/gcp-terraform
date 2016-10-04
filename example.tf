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

// Create a new instance
//resource "google_compute_instance" "example" {
//}

