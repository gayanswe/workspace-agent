output "vpc_self_link" {
  description = "The self_link of the created VPC network."
  value       = module.network.vpc_self_link
}

output "subnet_self_link" {
  description = "The self_link of the created private subnet."
  value       = module.network.subnet_self_link
}

output "subnet_ip_cidr_range" {
  description = "The IP CIDR range of the created private subnet."
  value       = module.network.subnet_ip_cidr_range
}