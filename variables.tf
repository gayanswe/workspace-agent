variable "project_id" {
  description = "GCP Project ID"
  type        = string
  default     = "euphoric-effect-479410-a6"
}

variable "region" {
  description = "GCP Region"
  type        = string
  default     = "us-east4"
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
  default     = "new-project-vpc"
}

variable "subnet_cidr" {
  description = "CIDR range for the primary subnet within the VPC"
  type        = string
  default     = "10.0.4.0/24"
}

variable "github_ci_cd_ip_ranges" {
  description = "List of IP CIDR ranges for GitHub CI/CD that require SSH access. This should be specific IPs, not 0.0.0.0/0 in production."
  type        = list(string)
  default     = ["0.0.0.0/0"] # Placeholder: Replace with actual GitHub CI/CD IP ranges from dashboard configuration
}

variable "vpc_cidr" {
  description = "The overall CIDR block for the VPC. Used for internal firewall rules."
  type        = string
  default     = "10.0.4.0/24" # Aligns with Zen's architecture diagram for the VPC range
}