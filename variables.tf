variable "project_id" {
  description = "The GCP project ID where resources will be created."
  type        = string
  default     = "euphoric-effect-479410-a6"
}

variable "region" {
  description = "The GCP region for the VPC and subnet."
  type        = string
  default     = "us-east4"
}

variable "environment" {
  description = "The deployment environment (e.g., development, staging, production)."
  type        = string
  default     = "development" # As per Jin's proposal
}

variable "project_name_prefix" {
  description = "A short prefix for resource naming, typically derived from the project name."
  type        = string
  default     = "new-project" # Derived from "New Project-infrastructure"
}

variable "vpc_cidr_range" {
  description = "The primary CIDR range for the VPC network."
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_cidr_range" {
  description = "The CIDR range for the private subnet."
  type        = string
  default     = "10.0.4.0/24"
}

variable "ssh_source_ranges" {
  description = "List of CIDR blocks from which SSH access (TCP:22) is allowed to instances in the private subnet."
  type        = list(string)
  # WARNING: 0.0.0.0/0 is highly permissive for SSH access.
  # In a production environment, this should be restricted to known administration IPs.
  # For this exercise, it aligns with "client-ip]/32" as a placeholder for allowing ingress.
  default = ["0.0.0.0/0"]
}