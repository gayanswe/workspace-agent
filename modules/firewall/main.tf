resource "google_compute_firewall" "allow_ssh_github" {
  project     = var.project_id
  name        = var.firewall_ssh_name
  network     = var.vpc_network_name
  description = "Allow SSH ingress from GitHub CI/CD source ranges."

  direction     = "INGRESS"
  priority      = 1000 # Default priority, can be adjusted
  source_ranges = var.github_ci_cd_source_ranges

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  labels = {
    environment = var.environment
    project     = var.project_name
    managed_by  = "terraform"
    created_by  = "opscontinuum"
  }
}

resource "google_compute_firewall" "allow_egress_all" {
  project     = var.project_id
  name        = var.firewall_egress_name
  network     = var.vpc_network_name
  description = "Allow all egress traffic from instances in the VPC."

  direction        = "EGRESS"
  priority         = 1000 # Default priority, can be adjusted
  destination_ranges = ["0.0.0.0/0"] # Allow egress to all destinations

  allow {
    protocol = "all"
  }

  labels = {
    environment = var.environment
    project     = var.project_name
    managed_by  = "terraform"
    created_by  = "opscontinuum"
  }
}