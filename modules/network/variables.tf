variable "project_id" {
  description = "GCP Project ID."
  type        = string
}

variable "region" {
  description = "GCP Region for resource deployment."
  type        = string
}

variable "environment" {
  description = "Deployment environment (e.g., dev, stage, prod)."
  type        = string
}

variable "project_name" {
  description = "Logical project name used in resource naming conventions."
  type        = string
}

variable "vpc_name" {
  description = "Name for the custom VPC network."
  type        = string
}

variable "subnet_name" {
  description = "Name for the private subnet."
  type        = string
}

variable "subnet_cidr" {
  description = "CIDR block for the private subnet."
  type        = string
}

variable "github_actions_ip_ranges" {
  description = "List of CIDR ranges for GitHub Actions runners to allow SSH ingress."
  type        = list(string)
}