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
  description = "Name of the VPC to create"
  type        = string
  default     = "new-project-vpc"
}

variable "subnet_cidr" {
  description = "CIDR range for the primary subnet"
  type        = string
  default     = "10.0.4.0/24"
}

variable "ssh_source_ranges" {
  description = "List of CIDR ranges that can initiate SSH connections. Use ['0.0.0.0/0'] for public."
  type        = list(string)
  default     = ["0.0.0.0/0"]
}