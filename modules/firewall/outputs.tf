output "allow_ssh_rule_name" {
  description = "The name of the firewall rule allowing SSH."
  value       = google_compute_firewall.allow_ssh.name
}

output "allow_egress_rule_name" {
  description = "The name of the firewall rule allowing all egress."
  value       = google_compute_firewall.allow_egress.name
}