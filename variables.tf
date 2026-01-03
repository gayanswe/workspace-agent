variable "project_id" {
  description = "GCP Project ID"
  type        = string
  default     = "euphoric-effect-479410-a6"
}

variable "region" {
  description = "GCP Region for resource deployment"
  type        = string
  default     = "us-east4"
}

variable "vpc_name" {
  description = "Name for the main VPC network"
  type        = string
  default     = "new-project-vpc"
}

variable "vpc_cidr" {
  description = "The primary CIDR range for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "private_subnet_cidr" {
  description = "CIDR range for the private subnet within the VPC"
  type        = string
  default     = "10.0.4.0/24"
}

variable "ssh_source_ranges" {
  description = "List of CIDR ranges that are allowed to SSH into instances (e.g., your office IP, CI/CD runner IPs)"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}