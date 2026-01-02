output "router_name" {
  description = "The name of the Cloud Router used for NAT."
  value       = google_compute_router.nat_router.name
}

output "nat_gateway_name" {
  description = "The name of the Cloud NAT gateway."
  value       = google_compute_router_nat.nat_gateway.name
}