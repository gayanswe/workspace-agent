variable "project_id" {
  description = "GCP Project ID. Configured in the dashboard."
  type        = string
  default     = "euphoric-effect-479410-a6"
}

variable "region" {
  description = "GCP Region for resource deployment."
  type        = string
  default     = "us-east4"
}

variable "environment" {
  description = "Deployment environment (e.g., dev, stage, prod)."
  type        = string
  default     = "dev"
}

variable "project_name" {
  description = "Logical project name used in resource naming conventions."
  type        = string
  default     = "newproject"
}

variable "subnet_cidr" {
  description = "CIDR block for the private subnet."
  type        = string
  default     = "10.0.4.0/24"
}

variable "github_actions_ip_ranges" {
  description = "List of CIDR ranges for GitHub Actions runners to allow SSH ingress. IMPORTANT: Update this with current GitHub Actions IP ranges from https://api.github.com/meta or equivalent before deployment. Default is a common, but potentially incomplete, placeholder example."
  type        = list(string)
  default     = ["140.82.112.0/20"] # Example placeholder, check GitHub API for current ranges
}