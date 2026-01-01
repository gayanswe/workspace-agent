resource "google_compute_firewall" "allow_ssh" {
  name    = "allow-ssh"
  network = var.network_name
  project = var.project_id

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["ssh"] # To apply firewall rule to specific instances, add tag 'ssh' to the instance.
}

resource "google_compute_firewall" "allow_egress" {
  name    = "allow-egress"
  network = var.network_name
  project = var.project_id

  allow {
    protocol = "all"
    ports    = ["0-65535"]
  }

  destination_ranges = ["0.0.0.0/0"]
  direction          = "EGRESS" # Set direction to Egress
}