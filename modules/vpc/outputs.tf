output "network_name" {
  description = "The name of the custom VPC network."
  value       = google_compute_network.custom_vpc.name
}

output "network_self_link" {
  description = "The self_link of the custom VPC network."
  value       = google_compute_network.custom_vpc.self_link
}

output "subnet_name" {
  description = "The name of the custom subnetwork."
  value       = google_compute_subnetwork.subnet_primary.name
}

output "subnet_id" {
  description = "The ID of the custom subnetwork."
  value       = google_compute_subnetwork.subnet_primary.id
}