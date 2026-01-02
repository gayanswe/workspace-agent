variable "project_id" {
  description = "GCP Project ID."
  type        = string
  default     = "euphoric-effect-479410-a6"
}

variable "region" {
  description = "GCP Region for resource deployment."
  type        = string
  default     = "us-east4"
}

variable "environment" {
  description = "Deployment environment (e.g., dev, prod, staging)."
  type        = string
  default     = "dev"
}

variable "project_short_name" {
  description = "Short name for the project, used in resource naming conventions."
  type        = string
  default     = "new-project"
}

variable "subnet_cidr" {
  description = "CIDR block for the private subnetwork. As per architecture, the VPC will contain a single subnet with this range."
  type        = string
  default     = "10.0.4.0/24"
  validation {
    condition     = can(cidrhost(var.subnet_cidr, 0))
    error_message = "The subnet_cidr value must be a valid CIDR block (e.g., '10.0.4.0/24')."
  }
}

variable "client_ip_ssh_source_range" {
  description = "CIDR block(s) from which SSH access (port 22) is allowed. For production, this should be highly restricted to specific IPs (e.g., 'YOUR_OFFICE_IP/32'). A value of '0.0.0.0/0' is insecure and should only be used for testing purposes."
  type        = list(string)
  default     = ["0.0.0.0/0"]
  validation {
    condition     = all([for cidr in var.client_ip_ssh_source_range : can(cidrhost(cidr, 0))])
    error_message = "Each entry in client_ip_ssh_source_range must be a valid CIDR block (e.g., '192.168.1.1/32')."
  }
}