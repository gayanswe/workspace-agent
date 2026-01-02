variable "project_id" {
  description = "The GCP project ID."
  type        = string
}

variable "region" {
  description = "The GCP region for the network and subnetwork."
  type        = string
}

variable "environment" {
  description = "The deployment environment, used for naming."
  type        = string
}

variable "project_name_prefix" {
  description = "A prefix for resource names."
  type        = string
}

variable "vpc_network_name" {
  description = "Base name for the VPC network resource."
  type        = string
}

variable "subnet_cidr_block" {
  description = "The CIDR range for the primary subnetwork."
  type        = string
}