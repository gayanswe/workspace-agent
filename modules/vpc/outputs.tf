output "network_id" {
  value       = google_compute_network.vpc.id
  description = "The ID of the network"
}

output "network_name" {
  value = google_compute_network.vpc.name
  description = "The name of the network"
}

output "subnet_id" {
  value       = google_compute_subnetwork.subnet.id
  description = "The ID of the subnet"
}