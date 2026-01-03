output "vpc_id" {
  description = "The ID of the custom VPC"
  value       = google_compute_network.vpc.id
}

output "vpc_self_link" {
  description = "The self_link of the custom VPC"
  value       = google_compute_network.vpc.self_link
}

output "private_subnet_id" {
  description = "The ID of the private subnet"
  value       = google_compute_subnetwork.private.id
}

output "private_subnet_self_link" {
  description = "The self_link of the private subnet"
  value       = google_compute_subnetwork.private.self_link
}

output "cloud_router_name" {
  description = "The name of the Cloud Router for NAT"
  value       = google_compute_router.router.name
}

output "cloud_nat_name" {
  description = "The name of the Cloud NAT gateway"
  value       = google_compute_router_nat.nat.name
}