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
  description = "Name of the VPC"
  type        = string
  default     = "main-vpc"
}

variable "private_subnet_cidr" {
  description = "CIDR range for the private subnet"
  type        = string
  default     = "10.0.4.0/24"
}

variable "github_cicd_ips" {
  description = "List of IP ranges for GitHub CI/CD to allow SSH access"
  type        = list(string)
  default     = ["192.30.252.0/22", "185.199.108.0/22", "140.82.112.0/20"]
}

variable "vpc_cidr" {
  description = "Overall CIDR block for the VPC, used for internal firewall rules."
  type        = string
  default     = "10.0.0.0/16" # Zen's architecture specified this
}