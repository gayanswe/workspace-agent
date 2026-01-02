variable "project_id" {
  description = "The GCP project ID where resources will be deployed."
  type        = string
  default     = "euphoric-effect-479410-a6" # Hardcoded as per instructions
}

variable "region" {
  description = "The GCP region for deploying resources."
  type        = string
  default     = "us-east4"
}

variable "environment" {
  description = "The deployment environment (e.g., 'dev', 'prod', 'staging'). Used for naming conventions."
  type        = string
  default     = "dev"
}

variable "project_prefix" {
  description = "A short prefix for project resources, used in naming conventions. Corresponds to 'New Project' context."
  type        = string
  default     = "newproject"
}

variable "vpc_cidr_block" {
  description = "The primary CIDR range for the custom VPC (e.g., '10.0.0.0/16')."
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_cidr_block" {
  description = "The CIDR range for the main subnetwork (e.g., '10.0.4.0/24')."
  type        = string
  default     = "10.0.4.0/24"
}

variable "subnet_name_suffix" {
  description = "A suffix to append to the subnet name for better identification (e.g., 'web', 'db')."
  type        = string
  default     = "web"
}

variable "ssh_ingress_source_ranges" {
  description = "List of CIDR ranges allowed to ingress TCP/22 (SSH). For production, restrict this to known IPs or use IAP/Bastion."
  type        = list(string)
  default     = ["0.0.0.0/0"]
}