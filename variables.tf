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

variable "environment" {
  description = "Deployment environment (e.g., dev, prod)"
  type        = string
  default     = "dev"
}

variable "project_name_short" {
  description = "Short name for the project, used in naming conventions"
  type        = string
  default     = "newproject" # From "New Project"
}

variable "vpc_cidr" {
  description = "CIDR range for the entire VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "private_subnet_cidr" {
  description = "CIDR range for the private subnet"
  type        = string
  default     = "10.0.4.0/24"
}

variable "github_cicd_ip_ranges" {
  description = "List of IP ranges for GitHub CI/CD to allow SSH access. CRITICAL: Replace with actual GitHub IP ranges in production for security."
  type        = list(string)
  default     = ["0.0.0.0/0"] # Placeholder for broad access; refine for production
}