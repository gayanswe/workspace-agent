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
  description = "VPC Name"
  type        = string
  default     = "new-project-vpc-us-east4"
}

variable "subnet_name" {
  description = "Subnet Name"
  type        = string
  default     = "new-project-subnet-us-east4"
}

variable "subnet_cidr" {
  description = "Subnet CIDR"
  type        = string
  default     = "10.0.4.0/24"
}

variable "allow_ssh_from" {
  description = "Source IP range for SSH access"
  type        = string
  default     = "0.0.0.0/0" # Please restrict to your IP range for security
}