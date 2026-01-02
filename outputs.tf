output "vpc_name" {
  description = "The name of the created VPC network."
  value       = module.vpc_network.vpc_name
}

output "subnet_name" {
  description = "The name of the created private subnetwork."
  value       = module.vpc_network.subnet_name
}

output "subnet_self_link" {
  description = "The self_link of the created private subnetwork."
  value       = module.vpc_network.subnet_self_link
}

output "cloud_nat_name" {
  description = "The name of the Cloud NAT gateway."
  value       = module.vpc_cloudnat.nat_gateway_name
}