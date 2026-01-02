variable "project_id" {
  description = "GCP Project ID."
  type        = string
}

variable "region" {
  description = "GCP Region for the subnet."
  type        = string
}

variable "environment" {
  description = "Deployment environment (e.g., dev, staging, prod) for naming."
  type        = string
}

variable "project_name_prefix" {
  description = "A short identifier for the project, used in resource naming conventions."
  type        = string
}

variable "subnet_ip_cidr_range" {
  description = "IP CIDR range for the custom subnet."
  type        = string
}