resource "google_compute_network" "vpc" {
  project                 = var.project_id
  name                    = "${var.environment}-${var.project_name_prefix}-vpc-${var.region}"
  auto_create_subnetworks = false
  routing_mode            = "REGIONAL" # Best practice for granular control and costs

  labels = {
    environment = var.environment
    project     = var.project_name_prefix
    managed_by  = "terraform"
    created_by  = "opscontinuum"
  }
}

resource "google_compute_subnetwork" "private" {
  project                 = var.project_id
  name                    = "${var.environment}-${var.project_name_prefix}-private-subnet-${var.region}"
  ip_cidr_range           = var.subnet_cidr_range
  region                  = var.region
  network                 = google_compute_network.vpc.self_link
  private_ip_google_access = var.private_google_access # Enables Private Google Access for instances in this subnet

  labels = {
    environment = var.environment
    project     = var.project_name_prefix
    managed_by  = "terraform"
    created_by  = "opscontinuum"
  }
}