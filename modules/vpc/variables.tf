variable "project_id" {
  description = "GCP Project ID."
  type        = string
}

variable "region" {
  description = "GCP Region for resource deployment."
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

variable "subnet_cidr" {
  description = "CIDR block for the private subnetwork."
  type        = string
}