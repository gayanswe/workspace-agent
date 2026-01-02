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
  description = "Name of the VPC network"
  type        = string
  default     = "new-project-vpc"
}

variable "vpc_cidr" {
  description = "CIDR range for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_cidr" {
  description = "CIDR range for the subnet"
  type        = string
  default     = "10.0.4.0/24"
}

variable "github_ci_cd_ip_ranges" {
  description = "List of CIDR ranges from which GitHub CI/CD is allowed to SSH"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}