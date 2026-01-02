output "allow_ssh_rule_name" {
  description = "The name of the SSH ingress firewall rule."
  value       = google_compute_firewall.allow_ssh.name
}

output "allow_egress_all_rule_name" {
  description = "The name of the all egress firewall rule."
  value       = google_compute_firewall.allow_egress_all.name
}