variable "project_id" {
  description = "The GCP project ID."
  type        = string
}

variable "network_name" {
  description = "The name of the VPC network to apply firewall rules to."
  type        = string
}

variable "environment" {
  description = "The deployment environment."
  type        = string
}

variable "project_name_prefix" {
  description = "A short prefix for resource naming."
  type        = string
}

variable "ssh_source_ranges" {
  description = "List of CIDR blocks from which SSH access (TCP:22) is allowed."
  type        = list(string)
}

variable "subnet_self_link" {
  description = "Self link of the subnet for context, though not directly used in firewall rules for source/destination."
  type        = string
  # Added for completeness, but not directly used in rule definition.
  # The subnet CIDR is implied for instances within it, which are targeted by tags.
}