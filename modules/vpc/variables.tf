variable "project_id" {
  description = "The GCP project ID."
  type        = string
}

variable "region" {
  description = "The GCP region for the VPC and subnet."
  type        = string
}

variable "environment" {
  description = "The deployment environment (e.g., development, staging, production)."
  type        = string
}

variable "project_name_prefix" {
  description = "A short prefix for resource naming."
  type        = string
}

variable "vpc_cidr_range" {
  description = "The primary CIDR range for the VPC network."
  type        = string
}

variable "subnet_cidr_range" {
  description = "The CIDR range for the private subnet."
  type        = string
}

variable "private_google_access" {
  description = "Whether to enable Private Google Access for instances in this subnet."
  type        = bool
  default     = false # Default to false, but architecture specifies true
}