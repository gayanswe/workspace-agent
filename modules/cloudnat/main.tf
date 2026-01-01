resource "google_compute_router" "router" {
  name    = "${var.environment}-newproject-router-us-east4"
  network = var.network_name
  region  = var.region
  project = var.project_id
}


resource "google_compute_router_nat" "nat" {
  name                          = "${var.environment}-newproject-cloudnat-us-east4"
  router                        = google_compute_router.router.name
  region                        = var.region
  project = var.project_id

  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
  subnetwork {
    name = var.subnet_name
    source_ip_ranges_to_nat = "ALL_IP_RANGES"
  }
}