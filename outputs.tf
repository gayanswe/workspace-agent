output "vpc_self_link" {
  description = "Self link of the created VPC network."
  value       = module.vpc.network_self_link
}

output "vpc_name" {
  description = "Name of the created VPC network."
  value       = module.vpc.network_name
}

output "subnet_self_link" {
  description = "Self link of the created subnet."
  value       = module.vpc.subnet_self_link
}

output "subnet_name" {
  description = "Name of the created subnet."
  value       = module.vpc.subnet_name
}

output "nat_router_name" {
  description = "Name of the Cloud Router used for NAT."
  value       = module.nat.router_name
}

output "nat_gateway_name" {
  description = "Name of the Cloud NAT gateway."
  value       = module.nat.nat_name
}