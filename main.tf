terraform {
  required_version = ">= 1.5.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_compute_network" "vpc" {
  name                    = var.vpc_name
  project                 = var.project_id
  auto_create_subnetworks = false
  routing_mode            = "REGIONAL"

  labels = {
    environment = var.environment
    project     = var.project_name
    managed_by  = "terraform"
    created_by  = "opscontinuum"
  }
}

resource "google_compute_subnetwork" "subnet" {
  name                     = "${var.vpc_name}-subnet"
  project                  = var.project_id
  region                   = var.region
  network                  = google_compute_network.vpc.self_link
  ip_cidr_range            = var.subnet_cidr
  private_ip_google_access = true

  labels = {
    environment = var.environment
    project     = var.project_name
    managed_by  = "terraform"
    created_by  = "opscontinuum"
  }
}

resource "google_compute_firewall" "allow_ssh_ingress" {
  name      = "${var.vpc_name}-allow-ssh-ingress"
  project   = var.project_id
  network   = google_compute_network.vpc.self_link
  direction = "INGRESS"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
  description   = "Allow SSH ingress from any IP to the VPC."

  # Note: google_compute_firewall does not directly support labels,
  # but metadata can be used with target_tags on instances.
}

resource "google_compute_firewall" "allow_all_egress" {
  name      = "${var.vpc_name}-allow-all-egress"
  project   = var.project_id
  network   = google_compute_network.vpc.self_link
  direction = "EGRESS"

  allow {
    protocol = "all"
  }

  destination_ranges = ["0.0.0.0/0"]
  description        = "Allow all egress traffic to any IP from the VPC."
}