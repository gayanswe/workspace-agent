output "network_self_link" {
  description = "Self link of the created VPC network."
  value       = google_compute_network.custom_vpc.self_link
}

output "network_name" {
  description = "Name of the created VPC network."
  value       = google_compute_network.custom_vpc.name
}

output "subnet_self_link" {
  description = "Self link of the created subnet."
  value       = google_compute_subnetwork.private_subnet.self_link
}

output "subnet_name" {
  description = "Name of the created subnet."
  value       = google_compute_subnetwork.private_subnet.name
}