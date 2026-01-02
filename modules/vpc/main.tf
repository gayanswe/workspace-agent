resource "google_compute_network" "vpc_network" {
  project                 = var.project_id
  name                    = var.vpc_name
  auto_create_subnetworks = false # As per architecture, one custom subnet will be created
  routing_mode            = "REGIONAL" # Best practice for regional deployments
  mtu                     = 1460 # Default MTU for GCP
  description             = "VPC network for ${var.environment} environment of ${var.project_name} project."

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
  ip_cidr_range              = var.subnet_cidr_range
  network                    = google_compute_network.vpc_network.self_link
  region                     = var.region
  private_ip_google_access   = true # Enabled as per architecture
  description                = "Private subnetwork for ${var.environment} environment."

  labels = {
    environment = var.environment
    project     = var.project_name
    managed_by  = "terraform"
    created_by  = "opscontinuum"
  }
}