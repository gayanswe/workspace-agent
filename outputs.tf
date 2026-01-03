output "vpc_id" {
  description = "The ID of the created VPC network"
  value       = google_compute_network.vpc.id
}

output "vpc_self_link" {
  description = "The self_link of the created VPC network"
  value       = google_compute_network.vpc.self_link
}

output "private_subnet_id" {
  description = "The ID of the created private subnet"
  value       = google_compute_subnetwork.private_subnet.id
}

output "private_subnet_self_link" {
  description = "The self_link of the created private subnet"
  value       = google_compute_subnetwork.private_subnet.self_link
}

output "router_name" {
  description = "The name of the Cloud Router"
  value       = google_compute_router.nat_router.name
}

output "nat_name" {
  description = "The name of the Cloud NAT gateway"
  value       = google_compute_router_nat.cloud_nat.name
}