output "vpc_id" {
  description = "The ID of the VPC"
  value       = google_compute_network.vpc.id
}

output "vpc_self_link" {
  description = "The self_link of the VPC"
  value       = google_compute_network.vpc.self_link
}

output "subnet_id" { # Updated output name
  description = "The ID of the private subnet"
  value       = google_compute_subnetwork.subnet.id
}

output "subnet_self_link" { # Updated output name
  description = "The self_link of the private subnet"
  value       = google_compute_subnetwork.subnet.self_link
}

output "cloud_nat_router_name" {
  description = "The name of the Cloud Router used for NAT"
  value       = google_compute_router.nat_router.name
}

output "cloud_nat_name" {
  description = "The name of the Cloud NAT instance"
  value       = google_compute_router_nat.cloud_nat.name
}