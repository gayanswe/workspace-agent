resource "google_compute_router" "cloud_router" {
  project = var.project_id
  name    = "${var.environment}-${var.project_name_prefix}-router-${var.region}"
  region  = var.region
  network = var.vpc_network_name

  labels = {
    environment = var.environment
    project     = var.project_name_prefix
    managed_by  = "terraform"
    created_by  = "opscontinuum"
  }
}

resource "google_compute_router_nat" "cloud_nat" {
  project                    = var.project_id
  name                       = "${var.environment}-${var.project_name_prefix}-nat-${var.region}"
  router                     = google_compute_router.cloud_router.name
  region                     = google_compute_router.cloud_router.region
  nat_ip_allocate_option     = "AUTO_ONLY" # Automatically allocate external IP addresses
  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS" # Target specific subnet
  
  subnetwork {
    name                    = var.subnet_self_link
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"] # NAT all IP ranges within the subnet
  }

  log_config {
    enable = true
    filter = "ERRORS_ONLY" # Log NAT translation errors for debugging
  }
  # Note: google_compute_router_nat resource itself does not support 'labels',
  # but its parent router provides the organizational context.
}