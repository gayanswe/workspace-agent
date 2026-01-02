output "vpc_id" {
  description = "The ID of the VPC network"
  value       = google_compute_network.vpc.id
}

output "vpc_self_link" {
  description = "The self_link of the VPC network"
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

output "cloud_nat_id" {
  description = "The ID of the Cloud NAT gateway"
  value       = google_compute_router_nat.nat.id
}