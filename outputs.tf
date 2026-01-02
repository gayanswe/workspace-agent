output "vpc_name" {
  description = "The name of the created VPC."
  value       = module.network.vpc_name
}

output "vpc_self_link" {
  description = "The self_link of the created VPC."
  value       = module.network.vpc_self_link
}

output "subnet_name" {
  description = "The name of the created subnetwork."
  value       = module.network.subnet_name
}

output "subnet_self_link" {
  description = "The self_link of the created subnetwork."
  value       = module.network.subnet_self_link
}