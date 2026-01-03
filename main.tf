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

locals {
  # Derived names based on naming conventions and input variables
  full_vpc_name        = "${var.environment}-${var.project_name_short}-vpc-${var.region}"
  private_subnet_name  = "${var.environment}-${var.project_name_short}-private-subnet-${var.region}"
  allow_ssh_fw_name    = "${var.environment}-${var.project_name_short}-allow-ssh"
  allow_egress_fw_name = "${var.environment}-${var.project_name_short}-allow-egress"
  router_name          = "${var.environment}-${var.project_name_short}-router-${var.region}"
  nat_name             = "${var.environment}-${var.project_name_short}-nat-${var.region}"
}

resource "google_compute_network" "vpc" {
  name                    = local.full_vpc_name
  project                 = var.project_id                 # ✅ ALWAYS include project
  auto_create_subnetworks = false                          # ✅ CRITICAL for manual subnets
  routing_mode            = "REGIONAL"
}

resource "google_compute_subnetwork" "private" {
  name                     = local.private_subnet_name
  project                  = var.project_id
  region                   = var.region
  network                  = google_compute_network.vpc.self_link # ✅ Use self_link
  ip_cidr_range            = var.private_subnet_cidr
  private_ip_google_access = true                         # ✅ Best practice for private access
}

resource "google_compute_firewall" "allow_ssh" {
  name      = local.allow_ssh_fw_name
  project   = var.project_id                             # ✅ ALWAYS include
  network   = google_compute_network.vpc.self_link       # ✅ Use self_link, NOT name
  direction = "INGRESS"                                  # ✅ ALWAYS specify direction
  priority  = 1000

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = var.github_cicd_ip_ranges              # From variable for flexibility
  target_tags   = ["ssh-enabled"]                        # Apply to instances with this tag
}

resource "google_compute_firewall" "allow_egress" {
  name      = local.allow_egress_fw_name
  project   = var.project_id
  network   = google_compute_network.vpc.self_link
  direction = "EGRESS"                                   # ✅ Explicitly egress
  priority  = 1000

  allow {
    protocol = "all"
  }

  destination_ranges = ["0.0.0.0/0"]                     # Allow all outbound traffic
}

resource "google_compute_router" "router" {
  name    = local.router_name
  project = var.project_id
  region  = var.region
  network = google_compute_network.vpc.self_link
}

resource "google_compute_router_nat" "nat" {
  name                               = local.nat_name
  project                            = var.project_id
  region                             = var.region
  router                             = google_compute_router.router.name
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES" # Covers private subnet
  log_config {
    enable = true
    filter = "ERRORS_ONLY"
  }
}