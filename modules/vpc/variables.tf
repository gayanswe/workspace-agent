variable "project_id" {
  description = "The GCP project ID to deploy resources into."
  type        = string
  default     = "euphoric-effect-479410-a6"
}

variable "region" {
  description = "The GCP region for the network resources."
  type        = string
  default     = "us-east4"
}

variable "environment" {
  description = "The deployment environment (e.g., 'dev', 'prod', 'staging'). Used for naming conventions."
  type        = string
  default     = "dev"
}

variable "project_name_prefix" {
  description = "A prefix for resource names, typically derived from the project's functional name."
  type        = string
  default     = "new-project"
}

variable "vpc_network_name" {
  description = "The name for the custom VPC network."
  type        = string
  default     = "vpc"
}

variable "subnet_cidr_block" {
  description = "The CIDR block for the subnet."
  type        = string
  default     = "10.0.4.0/24"
}