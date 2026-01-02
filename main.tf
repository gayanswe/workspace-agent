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
  auto_create_subnetworks = false           # CRITICAL for manual subnets
  routing_mode            = "REGIONAL"
}

resource "google_compute_subnetwork" "private_subnet" {
  name                     = "${var.vpc_name}-private-subnet"
  project                  = var.project_id
  region                   = var.region
  network                  = google_compute_network.vpc.self_link # Use self_link
  ip_cidr_range            = var.private_subnet_cidr
  private_ip_google_access = true           # Best practice for private access
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
  # This configures NAT for all primary IP ranges of all subnets on the router's network.
  # For more granular control, use "LIST_OF_SUBNETWORKS" and specify subnetwork_ip_ranges_for_nat.
}

resource "google_compute_firewall" "allow_ssh_github" {
  name      = "${var.vpc_name}-allow-ssh-github"
  project   = var.project_id
  network   = google_compute_network.vpc.self_link
  direction = "INGRESS"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = var.github_cicd_ips
  description   = "Allows SSH from GitHub Actions CI/CD IP ranges"
}

resource "google_compute_firewall" "allow_egress_all" {
  name            = "${var.vpc_name}-allow-egress-all"
  project         = var.project_id
  network         = google_compute_network.vpc.self_link
  direction       = "EGRESS" # ALWAYS specify direction

  allow {
    protocol = "all" # Allows all protocols
  }

  destination_ranges = ["0.0.0.0/0"] # Allows egress to all destinations
  description        = "Allows all outbound traffic from the VPC network"
}