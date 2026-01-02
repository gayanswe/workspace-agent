output "ssh_firewall_rule_name" {
  description = "Name of the SSH ingress firewall rule."
  value       = google_compute_firewall.allow_ssh_github.name
}

output "egress_firewall_rule_name" {
  description = "Name of the egress all firewall rule."
  value       = google_compute_firewall.allow_egress_all.name
}