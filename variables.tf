variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "region" {
  description = "GCP Region"
  type        = string
  default     = "us-east4"
}

variable "vpc_name" {
  description = "VPC Name"
  type        = string
  default     = "dev-vpc"
}

variable "subnet_name" {
  description = "Subnet Name"
  type        = string
  default     = "dev-subnet"
}

variable "subnet_cidr" {
  description = "Subnet CIDR"
  type        = string
  default     = "10.0.4.0/24"
}