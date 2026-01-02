variable "project_id" {
  description = "GCP Project ID."
  type        = string
}

variable "environment" {
  description = "Deployment environment (e.g., dev, prod, staging)."
  type        = string
}

variable "project_short_name" {
  description = "Short name for the project, used in resource naming conventions."
  type        = string
}

variable "network_name" {
  description = "The name of the VPC network to apply firewall rules to."
  type        = string
}

variable "client_ip_ssh_source_range" {
  description = "CIDR block(s) from which SSH access (port 22) is allowed."
  type        = list(string)
}