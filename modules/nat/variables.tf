variable "project_id" {
  description = "GCP Project ID."
  type        = string
}

variable "region" {
  description = "GCP Region for the Cloud Router and NAT."
  type        = string
}

variable "vpc_network_name" {
  description = "Name of the VPC network where the router and NAT will be created."
  type        = string
}

variable "subnet_self_link" {
  description = "Self link of the subnet for which NAT is configured."
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