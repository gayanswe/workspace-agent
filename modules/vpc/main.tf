resource "google_compute_network" "custom_vpc" {
  name                    = "${var.environment}-${var.project_name_prefix}-${var.vpc_network_name}-${var.region}"
  project                 = var.project_id
  auto_create_subnetworks = false
  routing_mode            = "REGIONAL" # Best practice for custom mode VPCs

  labels = {
    environment = var.environment
    project     = var.project_name_prefix
    managed_by  = "terraform"
    created_by  = "opscontinuum"
  }
}

resource "google_compute_subnetwork" "subnet_primary" {
  name                     = "${var.environment}-${var.project_name_prefix}-subnet-${var.region}"
  project                  = var.project_id
  ip_cidr_range            = var.subnet_cidr_block
  region                   = var.region
  network                  = google_compute_network.custom_vpc.self_link
  private_ip_google_access = true # As per architect

  labels = {
    environment = var.environment
    project     = var.project_name_prefix
    managed_by  = "terraform"
    created_by  = "opscontinuum"
  }
}