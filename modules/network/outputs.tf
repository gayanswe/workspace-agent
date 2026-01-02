output "vpc_name" {
  description = "The name of the created VPC."
  value       = google_compute_network.vpc.name
}

output "vpc_self_link" {
  description = "The self_link of the created VPC."
  value       = google_compute_network.vpc.self_link
}

output "subnet_name" {
  description = "The name of the created subnetwork."
  value       = google_compute_subnetwork.subnet.name
}

output "subnet_self_link" {
  description = "The self_link of the created subnetwork."
  value       = google_compute_subnetwork.subnet.self_link
}