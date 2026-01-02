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
  description = "Base name for the VPC and related resources. (e.g., prod-newproject)"
  type        = string
  default     = "prod-newproject"
}

variable "subnet_cidr" {
  description = "CIDR range for the private subnet"
  type        = string
  default     = "10.0.4.0/24"
}

variable "ssh_source_ranges" {
  description = "List of CIDR ranges allowed to connect via SSH. CRITICAL: Narrow this to specific IPs for production."
  type        = list(string)
  default     = ["0.0.0.0/0"] # WARNING: In production, narrow this to specific admin IPs.
}