output "vpc_name" {
  description = "The name of the created VPC network."
  value       = google_compute_network.vpc.name
}

output "vpc_self_link" {
  description = "The self_link of the created VPC network."
  value       = google_compute_network.vpc.self_link
}

output "subnet_name" {
  description = "The name of the created private subnetwork."
  value       = google_compute_subnetwork.private.name
}

output "subnet_self_link" {
  description = "The self_link of the created private subnetwork."
  value       = google_compute_subnetwork.private.self_link
}