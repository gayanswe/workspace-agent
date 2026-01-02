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
  auto_create_subnetworks = false           # ✅ CRITICAL for manual subnets
  routing_mode            = "REGIONAL"
}

resource "google_compute_subnetwork" "subnet" {
  name                     = "${var.vpc_name}-subnet"
  project                  = var.project_id
  region                   = var.region
  network                  = google_compute_network.vpc.self_link  # ✅ Use self_link
  ip_cidr_range            = var.subnet_cidr
  private_ip_google_access = true  # ✅ Best practice for private access
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
}

resource "google_compute_firewall" "allow_ssh_cicd" {
  name      = "${var.vpc_name}-allow-ssh-cicd"
  project   = var.project_id                             # ✅ ALWAYS include
  network   = google_compute_network.vpc.self_link       # ✅ Use self_link, NOT name
  direction = "INGRESS"                                  # ✅ ALWAYS specify direction

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = var.github_ci_cd_ip_ranges # IPs from GitHub CI/CD, specified in variables.tf
  target_tags   = ["ssh-cicd-enabled"]       # Optional: limit to tagged instances
}

resource "google_compute_firewall" "allow_egress_all" {
  name                = "${var.vpc_name}-allow-egress-all"
  project             = var.project_id                             # ✅ ALWAYS include
  network             = google_compute_network.vpc.self_link       # ✅ Use self_link, NOT name
  direction           = "EGRESS"                                   # ✅ ALWAYS specify direction

  allow {
    protocol = "all"
  }

  destination_ranges = ["0.0.0.0/0"] # Allow all egress traffic
}