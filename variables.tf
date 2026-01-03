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
  description = "Name of the VPC. Will be used as a prefix for other resources. Made more explicit to avoid regional confusion."
  type        = string
  default     = "new-project-main-vpc-us-east4" # Updated for explicit region in name
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC. Note: GCP VPCs are global and do not have a primary CIDR block. This is mainly for documentation or internal firewall rules."
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_cidr" {
  description = "CIDR range for the private subnet"
  type        = string
  default     = "10.0.1.0/24" # Changed to match general subnet pattern
}

variable "ssh_source_ranges" {
  description = "List of CIDR blocks allowed to SSH into instances with 'ssh-enabled' tag."
  type        = list(string)
  default     = ["0.0.0.0/0"] # For broad access; restrict this in production.
}