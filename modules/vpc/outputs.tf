output "network_name" {
  description = "The name of the created VPC network."
  value       = google_compute_network.vpc.name
}

output "network_self_link" {
  description = "The self_link of the created VPC network."
  value       = google_compute_network.vpc.self_link
}

output "subnet_name" {
  description = "The name of the created subnetwork."
  value       = google_compute_subnetwork.private.name
}

output "subnet_self_link" {
  description = "The self_link of the created subnetwork."
  value       = google_compute_subnetwork.private.self_link
}

output "router_name" {
  description = "The name of the Cloud Router."
  value       = google_compute_router.router.name
}

output "nat_name" {
  description = "The name of the Cloud NAT gateway."
  value       = google_compute_router_nat.nat_gateway.name
}