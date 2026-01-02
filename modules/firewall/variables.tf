variable "project_id" {
  description = "GCP Project ID."
  type        = string
}

variable "vpc_network_name" {
  description = "Name of the VPC network to apply firewall rules to."
  type        = string
}

variable "subnet_ip_cidr_range" {
  description = "IP CIDR range of the subnet (used in description for clarity, not for rule matching)."
  type        = string
}

variable "ssh_ingress_source_ranges" {
  description = "List of IP CIDR ranges that are allowed to SSH into instances."
  type        = list(string)
}

variable "ssh_target_tags" {
  description = "Network tags for instances that should allow SSH access."
  type        = list(string)
}

variable "firewall_priority" {
  description = "Priority for firewall rules. Lower values mean higher priority."
  type        = number
}

variable "environment" {
  description = "Deployment environment (e.g., dev, staging, prod) for naming and labels."
  type        = string
}

variable "project_name_prefix" {
  description = "A short identifier for the project, used in resource naming conventions and labels."
  type        = string
}

variable "region" {
  description = "GCP Region for naming purposes."
  type        = string
}