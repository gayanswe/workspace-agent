variable "project_id" {
  description = "GCP Project ID."
  type        = string
}

variable "environment" {
  description = "The environment (e.g., dev, stage, prod)."
  type        = string
}

variable "project_name" {
  description = "A short name for the project, used in resource naming."
  type        = string
}

variable "vpc_network_name" {
  description = "The name of the VPC network to apply firewall rules to."
  type        = string
}

variable "firewall_ssh_name" {
  description = "The name for the SSH ingress firewall rule."
  type        = string
}

variable "firewall_egress_name" {
  description = "The name for the all egress firewall rule."
  type        = string
}

variable "github_ci_cd_source_ranges" {
  description = "List of CIDR ranges for GitHub CI/CD to allow SSH access."
  type        = list(string)
}