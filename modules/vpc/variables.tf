variable "project_id" {
  type        = string
  description = "The ID of the project"
}

variable "region" {
  type        = string
  description = "The region to deploy the VPC"
}

variable "vpc_name" {
  type        = string
  description = "The name of the VPC"
  default     = "dev-vpc"
}

variable "subnet_name" {
  type        = string
  description = "The name of the subnet"
  default     = "dev-subnet"
}

variable "subnet_cidr" {
  type        = string
  description = "The CIDR range for the subnet"
}