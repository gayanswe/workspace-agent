output "firewall_ssh_rule_name" {
  description = "The name of the firewall rule allowing SSH from GitHub CI/CD."
  value       = google_compute_firewall.allow_ssh_github.name
}

output "firewall_egress_rule_name" {
  description = "The name of the firewall rule allowing all egress traffic."
  value       = google_compute_firewall.allow_egress_all.name
}