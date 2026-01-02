resource "google_compute_router" "nat_router" {
  project = var.project_id
  name    = "${var.environment}-${var.project_name_prefix}-router-${var.region}"
  region  = var.region
  network = var.network_name

  labels = {
    environment = var.environment
    project     = var.project_name_prefix
    managed_by  = "terraform"
    created_by  = "opscontinuum"
  }
}

resource "google_compute_router_nat" "nat_gateway" {
  project                          = var.project_id
  name                             = "${var.environment}-${var.project_name_prefix}-cloudnat-${var.region}"
  router                           = google_compute_router.nat_router.name
  region                           = google_compute_router.nat_router.region
  nat_ip_allocate_option           = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"

  subnetwork {
    name                    = var.subnet_self_link
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }

  labels = {
    environment = var.environment
    project     = var.project_name_prefix
    managed_by  = "terraform"
    created_by  = "opscontinuum"
  }
}