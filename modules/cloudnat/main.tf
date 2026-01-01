resource "google_compute_router" "router" {
  name    = "router"
  network = var.network_name
  region  = var.region
  project = var.project_id
}

resource "google_compute_router_nat" "nat" {
  name                          = "nat-config"
  router                        = google_compute_router.router.name
  region                        = var.region
  project                       = var.project_id
  nat_ip_allocate_option        = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"

  subnetwork {
    name = var.subnet_name
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }
}