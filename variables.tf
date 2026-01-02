variable "project_id" {
  description = "GCP Project ID"
  type        = string
  default     = "euphoric-effect-479410-a6"
}

variable "region" {
  description = "GCP Region"
  type        = string
  default     = "us-east4"
}

variable "vpc_name" {
  description = "Name of the VPC. Follows naming convention: {env}-{project}-{resource}."
  type        = string
  default     = "dev-new-project-vpc"
}

variable "subnet_cidr" {
  description = "CIDR range for the primary subnet (e.g., 10.0.4.0/24)."
  type        = string
  default     = "10.0.4.0/24"
}

variable "environment" {
  description = "The environment name (e.g., dev, staging, prod) for resource labeling."
  type        = string
  default     = "dev"
}

variable "project_name" {
  description = "The logical project name (e.g., new-project) for resource labeling."
  type        = string
  default     = "new-project"
}