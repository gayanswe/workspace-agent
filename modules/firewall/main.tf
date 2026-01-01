resource "google_compute_firewall" "allow_ssh" {
  name    = "${var.environment}-newproject-allow-ssh"
  network = var.network_name
  project = var.project_id

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"] # Consider narrowing this for production

  target_tags = ["ssh"] # Apply this tag to instances needing SSH access
}

resource "google_compute_firewall" "allow_egress" {
  name    = "${var.environment}-newproject-allow-egress"
  network = var.network_name
  project = var.project_id

  direction = "EGRESS"
  allow {
    protocol = "all"
  }

  destination_ranges = ["0.0.0.0/0"]
}