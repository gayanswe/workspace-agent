resource "google_compute_network" "custom_vpc" {
  project                 = var.project_id
  name                    = "${var.environment}-${var.project_name_prefix}-vpc-${var.region}"
  auto_create_subnetworks = false

  labels = {
    environment = var.environment
    project     = var.project_name_prefix
    managed_by  = "terraform"
    created_by  = "opscontinuum"
  }
}

resource "google_compute_subnetwork" "private_subnet" {
  project                  = var.project_id
  name                     = "${var.environment}-${var.project_name_prefix}-subnet-${var.region}"
  ip_cidr_range            = var.subnet_ip_cidr_range
  region                   = var.region
  network                  = google_compute_network.custom_vpc.self_link
  private_ip_google_access = true # As requested, enable Private Google Access for the subnet.

  labels = {
    environment = var.environment
    project     = var.project_name_prefix
    managed_by  = "terraform"
    created_by  = "opscontinuum"
  }
}