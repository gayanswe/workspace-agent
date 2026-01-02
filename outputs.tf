output "vpc_id" {
  description = "The ID of the VPC"
  value       = google_compute_network.vpc.id
}

output "vpc_self_link" {
  description = "The self_link of the VPC"
  value       = google_compute_network.vpc.self_link
}

output "subnet_id" {
  description = "The ID of the primary subnet"
  value       = google_compute_subnetwork.subnet.id
}

output "subnet_self_link" {
  description = "The self_link of the primary subnet"
  value       = google_compute_subnetwork.subnet.self_link
}

output "router_name" {
  description = "The name of the Cloud Router"
  value       = google_compute_router.router.name
}

output "nat_name" {
  description = "The name of the Cloud NAT gateway"
  value       = google_compute_router_nat.nat.name
}