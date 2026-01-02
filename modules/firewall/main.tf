resource "google_compute_firewall" "allow_ssh" {
  name    = "new-project-allow-ssh"
  project = var.project_id
  network = var.network_name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = [var.allow_ssh_from]
  target_tags   = ["ssh"]
}

resource "google_compute_firewall" "allow_egress" {
  name    = "new-project-allow-egress"
  project = var.project_id
  network = var.network_name

  allow {
    protocol = "all"
  }

  direction     = "EGRESS"
  destination_ranges = ["0.0.0.0/0"]
}