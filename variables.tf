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
  description = "Deployment environment (e.g., dev, staging, prod)."
  type        = string
  default     = "dev"
}

variable "project_name_prefix" {
  description = "A short identifier for the project, used in resource naming conventions (e.g., 'newproject')."
  type        = string
  default     = "newproject"
}

variable "subnet_ip_cidr_range" {
  description = "IP CIDR range for the custom subnet."
  type        = string
  default     = "10.0.4.0/24"
}

variable "ssh_ingress_source_ranges" {
  description = "List of IP CIDR ranges that are allowed to SSH into instances. For production, ensure these are tightly controlled and regularly updated, especially for dynamic sources like GitHub CI/CD."
  type        = list(string)
  # Example GitHub Actions IP ranges (subject to change).
  # Refer to https://api.github.com/meta for current IP ranges under the 'actions' key, and manage dynamically in production.
  default     = ["140.82.112.0/20", "18.150.96.0/20", "185.199.108.0/22"]
}

variable "ssh_target_tags" {
  description = "Network tags for instances that should allow SSH access."
  type        = list(string)
  default     = ["ssh-target"]
}

variable "firewall_priority" {
  description = "Priority for firewall rules. Lower values mean higher priority."
  type        = number
  default     = 1000
}