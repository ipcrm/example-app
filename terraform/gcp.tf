variable "region" {}
variable "project" {}

terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.52.0"
    }
  }

  required_version = "> 0.14"
}

provider "google" {
  project = var.project
  region  = var.region
}

resource "google_compute_firewall" "enable-utility-ports" {
  name    = "utility-instance-ports"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["8888"]
  }

  allow {
    protocol = "tcp"
    ports    = ["1389"]
  }

  source_ranges = ["0.0.0.0/0"]
}
