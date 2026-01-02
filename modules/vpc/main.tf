resource "google_compute_network" "vpc" {
  project                 = var.project_id
  name                    = "${var.environment}-${var.project_short_name}-vpc-${var.region}"
  auto_create_subnetworks = false # Custom VPCs should not auto-create subnets
  routing_mode            = "REGIONAL" # Best practice for custom VPCs
  description             = "Custom VPC for ${var.project_short_name} project in ${var.environment} environment."
  labels = {
    environment = var.environment
    project     = var.project_short_name
    managed_by  = "terraform"
    created_by  = "opscontinuum"
  }
}

resource "google_compute_subnetwork" "private" {
  project                  = var.project_id
  name                     = "${var.environment}-${var.project_short_name}-private-subnet-${var.region}"
  ip_cidr_range            = var.subnet_cidr
  region                   = var.region
  network                  = google_compute_network.vpc.self_link
  private_ip_google_access = true # As per architecture requirement
  description              = "Private subnetwork for ${var.project_short_name} in ${var.environment} environment."
  labels = {
    environment = var.environment
    project     = var.project_short_name
    managed_by  = "terraform"
    created_by  = "opscontinuum"
  }
}

resource "google_compute_router" "router" {
  project     = var.project_id
  name        = "${var.environment}-${var.project_short_name}-router-${var.region}"
  region      = var.region
  network     = google_compute_network.vpc.self_link
  description = "Cloud Router for NAT in ${var.environment} environment."
  labels = {
    environment = var.environment
    project     = var.project_short_name
    managed_by  = "terraform"
    created_by  = "opscontinuum"
  }
}

resource "google_compute_router_nat" "nat_gateway" {
  project                            = var.project_id
  name                               = "${var.environment}-${var.project_short_name}-nat-${var.region}"
  router                             = google_compute_router.router.name
  region                             = var.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
  log_config {
    enable = true
    filter = "ERRORS_ONLY" # Log errors only for cost optimization
  }

  subnetwork {
    name                   = google_compute_subnetwork.private.name
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"] # NAT all IPs in this subnet
  }
  description = "Cloud NAT gateway for private subnet egress in ${var.environment} environment."
  labels = {
    environment = var.environment
    project     = var.project_short_name
    managed_by  = "terraform"
    created_by  = "opscontinuum"
  }
}