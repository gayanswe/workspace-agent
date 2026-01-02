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
}

resource "google_compute_subnetwork" "subnet" {
  name                     = "${var.vpc_name}-subnet"
  project                  = var.project_id
  region                   = var.region
  network                  = google_compute_network.vpc.self_link
  ip_cidr_range            = var.subnet_cidr
  private_ip_google_access = true
}

resource "google_compute_router" "router" {
  name    = "${var.vpc_name}-router"
  project = var.project_id
  region  = var.region
  network = google_compute_network.vpc.self_link
}

resource "google_compute_router_nat" "nat" {
  name                               = "${var.vpc_name}-nat"
  project                            = var.project_id
  region                             = var.region
  router                             = google_compute_router.router.name
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
  log_config {
    enable = true
    filter = "ERRORS_ONLY"
  }
}

resource "google_compute_firewall" "allow_ssh" {
  name      = "new-project-allow-ssh"
  project   = var.project_id
  network   = google_compute_network.vpc.self_link
  direction = "INGRESS"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["ssh-enabled"]
  priority      = 1000
}

resource "google_compute_firewall" "deny_all_ingress" {
  name      = "new-project-deny-all-ingress"
  project   = var.project_id
  network   = google_compute_network.vpc.self_link
  direction = "INGRESS"

  deny {
    protocol = "all"
  }

  source_ranges = ["0.0.0.0/0"]
  priority      = 65535
}

resource "google_compute_firewall" "allow_egress_all" {
  name      = "${var.vpc_name}-allow-egress-all"
  project   = var.project_id
  network   = google_compute_network.vpc.self_link
  direction = "EGRESS"

  allow {
    protocol = "all"
  }

  destination_ranges = ["0.0.0.0/0"]
  priority           = 1000
}