output "network_name" {
  description = "The name of the custom VPC network."
  value       = module.vpc_network.network_name
}

output "network_self_link" {
  description = "The self_link of the custom VPC network."
  value       = module.vpc_network.network_self_link
}

output "subnet_name" {
  description = "The name of the custom subnetwork."
  value       = module.vpc_network.subnet_name
}

output "subnet_id" {
  description = "The ID of the custom subnetwork."
  value       = module.vpc_network.subnet_id
}