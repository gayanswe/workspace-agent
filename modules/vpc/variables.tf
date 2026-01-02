variable "project_id" {
  description = "GCP Project ID."
  type        = string
}

variable "region" {
  description = "GCP Region for the VPC and subnet."
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

variable "vpc_name" {
  description = "The name of the VPC network to create."
  type        = string
}

variable "vpc_cidr_range" {
  description = "The CIDR range for the VPC network."
  type        = string
}

variable "subnet_name" {
  description = "The name of the private subnetwork to create."
  type        = string
}

variable "subnet_cidr_range" {
  description = "The CIDR range for the private subnetwork."
  type        = string
}