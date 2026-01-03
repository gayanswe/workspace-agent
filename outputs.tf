output "vpc_name" {
  description = "The name of the created VPC network"
  value       = google_compute_network.vpc.name
}

output "vpc_self_link" {
  description = "The self_link of the created VPC network"
  value       = google_compute_network.vpc.self_link
}

output "subnet_name" {
  description = "The name of the created subnetwork"
  value       = google_compute_subnetwork.subnet.name
}

output "subnet_self_link" {
  description = "The self_link of the created subnetwork"
  value       = google_compute_subnetwork.subnet.self_link
}

output "router_name" {
  description = "The name of the created Cloud Router"
  value       = google_compute_router.router.name
}

output "nat_name" {
  description = "The name of the created Cloud NAT"
  value       = google_compute_router_nat.nat.name
}