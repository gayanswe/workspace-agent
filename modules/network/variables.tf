variable "project_id" {
  description = "The GCP project ID."
  type        = string
}

variable "region" {
  description = "The GCP region for the network resources."
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

variable "vpc_cidr_block" {
  description = "The primary CIDR range for the custom VPC."
  type        = string
}

variable "subnet_cidr_block" {
  description = "The CIDR range for the main subnetwork."
  type        = string
}

variable "subnet_name_suffix" {
  description = "A suffix to append to the subnet name."
  type        = string
}