output "vpc_name" {
  description = "The name of the created VPC."
  value       = module.vpc_network.network_name
}

output "subnet_name" {
  description = "The name of the created subnetwork."
  value       = module.vpc_network.subnet_name
}

output "subnet_self_link" {
  description = "The self_link of the created subnetwork."
  value       = module.vpc_network.subnet_self_link
}

output "router_name" {
  description = "The name of the Cloud Router."
  value       = module.vpc_network.router_name
}

output "nat_name" {
  description = "The name of the Cloud NAT gateway."
  value       = module.vpc_network.nat_name
}

output "allow_ssh_firewall_rule_name" {
  description = "The name of the SSH ingress firewall rule."
  value       = module.firewall_rules.allow_ssh_rule_name
}

output "allow_egress_all_firewall_rule_name" {
  description = "The name of the all egress firewall rule."
  value       = module.firewall_rules.allow_egress_all_rule_name
}