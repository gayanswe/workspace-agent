variable "project_id" {
  description = "The GCP project ID."
  type        = string
}

variable "region" {
  description = "The GCP region for the Cloud NAT and router."
  type        = string
}

variable "network_name" {
  description = "The name of the VPC network where the NAT gateway will be deployed."
  type        = string
}

variable "subnet_self_link" {
  description = "The self_link of the subnetwork for which to enable NAT."
  type        = string
}

variable "environment" {
  description = "The deployment environment."
  type        = string
}

variable "project_name_prefix" {
  description = "A short prefix for resource naming."
  type        = string
}