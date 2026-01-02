output "vpc_id" {
  value = module.vpc.network_id
  description = "The ID of the VPC"
}

output "subnet_id" {
  value = module.vpc.subnet_id
  description = "The ID of the subnet"
}