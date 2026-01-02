output "vpc_self_link" {
  description = "The self_link of the created VPC network."
  value       = google_compute_network.vpc.self_link
}

output "vpc_name" {
  description = "The name of the created VPC network."
  value       = google_compute_network.vpc.name
}

output "subnet_self_link" {
  description = "The self_link of the created private subnet."
  value       = google_compute_subnetwork.private_subnet.self_link
}

output "subnet_ip_cidr_range" {
  description = "The IP CIDR range of the created private subnet."
  value       = google_compute_subnetwork.private_subnet.ip_cidr_range
}