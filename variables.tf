variable "project_id" {
  description = "GCP Project ID"
  type        = string
  default     = "euphoric-effect-479410-a6" # Correct Project ID
}

variable "region" {
  description = "GCP Region"
  type        = string
  default     = "us-east4"
}

variable "environment" {
  description = "Environment (e.g., dev, prod)"
  type        = string
  default     = "dev"
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
  default     = "dev-newproject-vpc-us-east4"
}

variable "subnet_cidr" {
  description = "CIDR block for the subnet"
  type        = string
  default     = "10.0.4.0/24"
}

variable "subnet_name" {
  description = "Name of the subnet"
  type        = string
  default     = "dev-newproject-web-subnet-us-east4"
}