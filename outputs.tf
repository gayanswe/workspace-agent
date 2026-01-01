output "vpc_name" {
  description = "The name of the VPC"
  value       = module.vpc.network_name
}

output "subnet_name" {
  description = "The name of the subnet"
  value       = module.vpc.subnet_name
}