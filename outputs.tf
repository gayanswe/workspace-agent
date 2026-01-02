output "vpc_self_link" {
  description = "The self_link of the created VPC network."
  value       = module.vpc_network.vpc_self_link
}

output "subnet_self_link" {
  description = "The self_link of the created private subnetwork."
  value       = module.vpc_network.subnet_self_link
}

output "firewall_ssh_rule_name" {
  description = "The name of the firewall rule allowing SSH from GitHub CI/CD."
  value       = module.firewall_rules.firewall_ssh_rule_name
}

output "firewall_egress_rule_name" {
  description = "The name of the firewall rule allowing all egress traffic."
  value       = module.firewall_rules.firewall_egress_rule_name
}