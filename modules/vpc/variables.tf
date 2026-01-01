variable "project_id" {
  description = "The ID of the project in which to provision resources."
  type        = string
}

variable "region" {
  description = "The region in which to provision resources."
  type        = string
}

variable "vpc_name" {
  description = "The name of the VPC."
  type        = string
}

variable "subnet_cidr" {
  description = "The CIDR range for the subnet."
  type        = string
}

variable "subnet_name" {
  description = "The name of the Subnet."
  type        = string
}

variable "environment" {
  description = "The environment this is deployed to."
  type        = string
}