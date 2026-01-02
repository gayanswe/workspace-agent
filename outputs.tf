output "vpc_id" {
  description = "The ID of the VPC"
  value       = google_compute_network.vpc.id
}

output "vpc_self_link" {
  description = "The self_link of the VPC"
  value       = google_compute_network.vpc.self_link
}

output "subnet_id" {
  description = "The ID of the subnet"
  value       = google_compute_subnetwork.subnet.id
}

output "subnet_self_link" {
  description = "The self_link of the subnet"
  value       = google_compute_subnetwork.subnet.self_link
}

output "nat_router_name" {
  description = "Name of the Cloud Router provisioned for NAT"
  value       = google_compute_router.router.name
}

output "nat_id" {
  description = "The ID of the Cloud NAT gateway"
  value       = google_compute_router_nat.nat.id
}

output "nat_self_link" {
  description = "The self_link of the Cloud NAT gateway"
  value       = google_compute_router_nat.nat.self_link
}