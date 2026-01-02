resource "google_compute_network" "vpc" {
  project                 = var.project_id
  name                    = var.vpc_name
  auto_create_subnetworks = false
  routing_mode            = "REGIONAL" # Explicitly set for clarity and consistency

  labels = {
    environment = var.environment
    project     = var.project_name
    managed_by  = "terraform"
    created_by  = "opscontinuum"
  }
}

resource "google_compute_subnetwork" "private_subnet" {
  project                    = var.project_id
  name                       = var.subnet_name
  ip_cidr_range              = var.subnet_cidr
  region                     = var.region
  network                    = google_compute_network.vpc.self_link
  private_ip_google_access   = true # Enable Private Google Access as per requirements

  labels = {
    environment = var.environment
    project     = var.project_name
    managed_by  = "terraform"
    created_by  = "opscontinuum"
  }
}

resource "google_compute_firewall" "allow_ssh_github" {
  project = var.project_id
  name    = "${var.environment}-${var.project_name}-allow-ssh-github"
  network = google_compute_network.vpc.self_link
  direction = "INGRESS"
  priority  = 1000 # Default priority

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = var.github_actions_ip_ranges

  labels = {
    environment = var.environment
    project     = var.project_name
    managed_by  = "terraform"
    created_by  = "opscontinuum"
  }
}

resource "google_compute_firewall" "allow_egress" {
  project = var.project_id
  name    = "${var.environment}-${var.project_name}-allow-egress"
  network = google_compute_network.vpc.self_link
  direction = "EGRESS"
  priority  = 1000 # Default priority, overrides implicit default if more specific

  allow {
    protocol = "all"
  }

  destination_ranges = ["0.0.0.0/0"] # Allow all outbound traffic

  labels = {
    environment = var.environment
    project     = var.project_name
    managed_by  = "terraform"
    created_by  = "opscontinuum"
  }
}

resource "google_compute_router" "nat_router" {
  project = var.project_id
  name    = "${var.environment}-${var.project_name}-router-${var.region}"
  region  = var.region
  network = google_compute_network.vpc.self_link

  labels = {
    environment = var.environment
    project     = var.project_name
    managed_by  = "terraform"
    created_by  = "opscontinuum"
  }
}

resource "google_compute_router_nat" "cloud_nat" {
  project                            = var.project_id
  name                               = "${var.environment}-${var.project_name}-cloudnat-${var.region}"
  router                             = google_compute_router.nat_router.name
  region                             = google_compute_router.nat_router.region
  nat_ip_allocate_option             = "AUTO_ONLY" # Automatically allocate external IP addresses
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"

  subnetwork {
    name                    = google_compute_subnetwork.private_subnet.self_link
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }

  log_config {
    enable = true
    filter = "ERRORS_ONLY" # Log only errors by default
  }

  depends_on = [google_compute_subnetwork.private_subnet] # Ensure subnet is created before NAT

  labels = {
    environment = var.environment
    project     = var.project_name
    managed_by  = "terraform"
    created_by  = "opscontinuum"
  }
}