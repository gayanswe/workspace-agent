resource "google_compute_firewall" "allow_ssh_github" {
  project = var.project_id
  name    = "${var.environment}-${var.project_name_prefix}-allow-ssh-github"
  network = var.vpc_network_name
  priority = var.firewall_priority

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = var.ssh_ingress_source_ranges
  target_tags   = var.ssh_target_tags

  description = "Allow SSH (TCP/22) from GitHub CI/CD source ranges to instances with '${join(",", var.ssh_target_tags)}' tag."

  labels = {
    environment = var.environment
    project     = var.project_name_prefix
    managed_by  = "terraform"
    created_by  = "opscontinuum"
  }
}

resource "google_compute_firewall" "allow_egress_all" {
  project = var.project_id
  name    = "${var.environment}-${var.project_name_prefix}-allow-egress"
  network = var.vpc_network_name
  priority = var.firewall_priority

  allow {
    protocol = "all"
  }

  destination_ranges = ["0.0.0.0/0"] # Egress to anywhere
  description = "Allow all egress traffic from instances within the VPC."

  labels = {
    environment = var.environment
    project     = var.project_name_prefix
    managed_by  = "terraform"
    created_by  = "opscontinuum"
  }
}