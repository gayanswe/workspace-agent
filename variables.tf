variable "project_id" {
  description = "GCP Project ID"
  type        = string
  default     = "euphoric-effect-479410-a6"
}

variable "region" {
  description = "GCP Region for resource deployment"
  type        = string
  default     = "us-east4"
}

variable "environment" {
  description = "The environment (e.g., dev, stage, prod), used in resource naming"
  type        = string
  default     = "dev"
}

variable "project_name" {
  description = "A short name for the project, used in resource naming"
  type        = string
  default     = "newproject"
}

variable "vpc_cidr_range" {
  description = "The CIDR range for the VPC network"
  type        = string
  default     = "10.0.4.0/24"
  validation {
    condition     = can(cidrhost(var.vpc_cidr_range, 0))
    error_message = "The vpc_cidr_range must be a valid CIDR block."
  }
}

variable "subnet_cidr_range" {
  description = "The CIDR range for the private subnetwork"
  type        = string
  default     = "10.0.4.0/24"
  validation {
    condition     = can(cidrhost(var.subnet_cidr_range, 0))
    error_message = "The subnet_cidr_range must be a valid CIDR block."
  }
}

variable "github_ci_cd_source_ranges" {
  description = "List of CIDR ranges for GitHub CI/CD to allow SSH access. This should be explicitly configured from the dashboard. Default is a dummy reserved range for security."
  type        = list(string)
  default     = ["192.0.2.0/24"] # Placeholder: TEST-NET-1. Update with specific GitHub CI/CD IP ranges.
  validation {
    condition = length(var.github_ci_cd_source_ranges) > 0 ? all([for cidr in var.github_ci_cd_source_ranges : can(cidrhost(cidr, 0))]...) : true
    error_message = "Each GitHub CI/CD source range must be a valid CIDR block, or the list can be empty."
  }
}