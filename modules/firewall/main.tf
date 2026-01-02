resource "google_compute_firewall" "allow_ssh" {
  project       = var.project_id
  name          = "${var.environment}-${var.project_short_name}-allow-ssh"
  network       = var.network_name
  direction     = "INGRESS"
  source_ranges = var.client_ip_ssh_source_range

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  description = "Allows SSH (TCP/22) ingress from specified IP ranges to instances in ${var.network_name}."
  labels = {
    environment = var.environment
    project     = var.project_short_name
    managed_by  = "terraform"
    created_by  = "opscontinuum"
  }
}

resource "google_compute_firewall" "allow_egress_all" {
  project            = var.project_id
  name               = "${var.environment}-${var.project_short_name}-allow-egress-all"
  network            = var.network_name
  direction          = "EGRESS"
  destination_ranges = ["0.0.0.0/0"]

  allow {
    protocol = "all"
  }
  description = "Allows all egress traffic from instances in ${var.network_name}."
  labels = {
    environment = var.environment
    project     = var.project_short_name
    managed_by  = "terraform"
    created_by  = "opscontinuum"
  }
}