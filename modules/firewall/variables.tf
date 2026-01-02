variable "project_id" {
  description = "The GCP project ID."
  type        = string
}

variable "environment" {
  description = "The deployment environment (e.g., 'dev', 'prod'). Used for naming conventions."
  type        = string
}

variable "project_prefix" {
  description = "A short prefix for project resources, used in naming conventions."
  type        = string
}

variable "network_name" {
  description = "The name of the VPC network to apply firewall rules to."
  type        = string
}

variable "subnet_cidr_block" {
  description = "The CIDR range of the subnetwork (used for context or potential future rule refinement)."
  type        = string
}

variable "ssh_ingress_source_ranges" {
  description = "List of CIDR ranges allowed to ingress TCP/22 (SSH)."
  type        = list(string)
}