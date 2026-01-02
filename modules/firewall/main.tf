resource "google_compute_firewall" "allow_ssh_ingress" {
  project     = var.project_id
  name        = "${var.environment}-${var.project_prefix}-allow-ssh"
  network     = var.network_name
  description = "Allow SSH (TCP/22) ingress from specified source ranges."

  direction = "INGRESS"
  priority  = 1000 # Default priority

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = var.ssh_ingress_source_ranges
  # If no target_tags are specified, the rule applies to all instances in the network.
  # For more granular control, attach target_tags to specific VMs.

  labels = {
    environment = var.environment
    project     = var.project_prefix
    managed_by  = "terraform"
    created_by  = "opscontinuum"
  }
}

resource "google_compute_firewall" "allow_egress_all" {
  project     = var.project_id
  name        = "${var.environment}-${var.project_prefix}-allow-egress-all"
  network     = var.network_name
  description = "Allow all egress traffic to all destinations from the network."

  direction = "EGRESS"
  priority  = 1000 # Default priority

  allow {
    protocol = "all"
  }

  destination_ranges = ["0.0.0.0/0"]
  # If no target_tags are specified, the rule applies to all instances in the network.

  labels = {
    environment = var.environment
    project     = var.project_prefix
    managed_by  = "terraform"
    created_by  = "opscontinuum"
  }
}