resource "google_compute_network" "vpc" {
  project                 = var.project_id
  name                    = "${var.environment}-${var.project_prefix}-vpc-${var.region}"
  auto_create_subnetworks = false
  routing_mode            = "REGIONAL" # Best practice for custom networks

  labels = {
    environment = var.environment
    project     = var.project_prefix
    managed_by  = "terraform"
    created_by  = "opscontinuum"
  }
}

resource "google_compute_subnetwork" "subnet" {
  project       = var.project_id
  name          = "${var.environment}-${var.project_prefix}-${var.subnet_name_suffix}-subnet-${var.region}"
  ip_cidr_range = var.subnet_cidr_block
  region        = var.region
  network       = google_compute_network.vpc.self_link
  stack_type    = "IPV4_ONLY" # Explicitly use IPv4

  labels = {
    environment = var.environment
    project     = var.project_prefix
    managed_by  = "terraform"
    created_by  = "opscontinuum"
  }
}