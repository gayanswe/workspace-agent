variable "project_id" {
  description = "GCP Project ID"
  type        = string
  default     = "euphoric-effect-479410-a6"
}

variable "region" {
  description = "GCP Region for resources"
  type        = string
  default     = "us-east4"
}

variable "environment" {
  description = "The environment name (e.g., dev, stage, prod)"
  type        = string
  default     = "dev"
}

variable "project_name" {
  description = "The short name of the project for naming conventions (e.g., newproject)"
  type        = string
  default     = "newproject"
}

variable "vpc_cidr" {
  description = "The CIDR range for the VPC network"
  type        = string
  default     = "10.0.4.0/24"
}

variable "subnet_cidr" {
  description = "The CIDR range for the primary subnetwork"
  type        = string
  default     = "10.0.4.0/24"
}