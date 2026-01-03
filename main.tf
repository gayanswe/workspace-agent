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
  auto_create_subnetworks = false           # CRITICAL for manual subnets, fixed from validation
  routing_mode            = "REGIONAL"
}

resource "google_compute_subnetwork" "private_subnet" {
  name                     = "${var.vpc_name}-private-subnet"
  project                  = var.project_id
  region                   = var.region
  network                  = google_compute_network.vpc.self_link # Use self_link
  ip_cidr_range            = var.private_subnet_cidr
  private_ip_google_access = true            # Best practice for private access
}

# Cloud Router for NAT
resource "google_compute_router" "router" {
  name    = "${var.vpc_name}-router"
  project = var.project_id
  region  = var.region
  network = google_compute_network.vpc.self_link
}

# Cloud NAT for private subnet egress
resource "google_compute_router_nat" "nat" {
  name                               = "${var.vpc_name}-nat"
  project                            = var.project_id
  region                             = var.region
  router                             = google_compute_router.router.name
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES" # Covers all IPs in defined subnets
  log_config {
    enable = true
    filter = "ERRORS_ONLY"
  }
}

# Firewall rule: Allow Ingress TCP/22 (SSH)
resource "google_compute_firewall" "allow_ssh" {
  name      = "${var.vpc_name}-allow-ssh"
  project   = var.project_id                             # Fixed: ALWAYS include project
  network   = google_compute_network.vpc.self_link       # Use self_link, NOT name
  direction = "INGRESS"                                  # Fixed: ALWAYS specify direction

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = var.ssh_source_ranges # Configurable via variable, defaults to 0.0.0.0/0
  target_tags   = ["ssh-enabled"]
  description   = "Allows SSH access on TCP port 22"
}

# Firewall rule: Allow Egress All
resource "google_compute_firewall" "allow_egress_all" {
  name      = "${var.vpc_name}-allow-egress-all"
  project   = var.project_id                             # Fixed: ALWAYS include project
  network   = google_compute_network.vpc.self_link       # Use self_link, NOT name
  direction = "EGRESS"                                   # Fixed: ALWAYS specify direction

  allow {
    protocol = "all"
  }

  destination_ranges = ["0.0.0.0/0"] # Egress rules use destination_ranges
  description        = "Allows all outbound traffic from the VPC"
}