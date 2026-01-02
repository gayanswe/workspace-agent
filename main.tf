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
  name                    = "${var.vpc_name}-vpc-${var.region}"
  project                 = var.project_id
  auto_create_subnetworks = false
  routing_mode            = "REGIONAL"
}

resource "google_compute_subnetwork" "private_subnet" {
  name                     = "${var.vpc_name}-private-subnet-${var.region}"
  project                  = var.project_id
  region                   = var.region
  network                  = google_compute_network.vpc.self_link
  ip_cidr_range            = var.subnet_cidr
  private_ip_google_access = true
}

resource "google_compute_firewall" "allow_ssh" {
  name      = "${var.vpc_name}-allow-ssh"
  project   = var.project_id
  network   = google_compute_network.vpc.self_link
  direction = "INGRESS"
  priority  = 1000

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = var.ssh_source_ranges
  description   = "Allows SSH access on TCP port 22 from specified source ranges."
}

resource "google_compute_firewall" "allow_egress_all" {
  name          = "${var.vpc_name}-allow-egress-all"
  project       = var.project_id
  network       = google_compute_network.vpc.self_link
  direction     = "EGRESS"
  priority      = 1000
  destination_ranges = ["0.0.0.0/0"]

  allow {
    protocol = "all"
  }
  description = "Allows all outbound traffic from the VPC."
}