output "vpc_name" {
  description = "The name of the created VPC network."
  value       = google_compute_network.vpc_network.name
}

output "vpc_self_link" {
  description = "The self_link of the created VPC network."
  value       = google_compute_network.vpc_network.self_link
}

output "subnet_name" {
  description = "The name of the created private subnetwork."
  value       = google_compute_subnetwork.private_subnet.name
}

output "subnet_self_link" {
  description = "The self_link of the created private subnetwork."
  value       = google_compute_subnetwork.private_subnet.self_link
}