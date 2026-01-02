output "allow_ssh_id" {
  value = google_compute_firewall.allow_ssh.id
}

output "allow_egress_id" {
  value = google_compute_firewall.allow_egress.id
}