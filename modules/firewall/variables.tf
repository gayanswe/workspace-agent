variable "project_id" {
  description = "Project ID"
  type        = string
}

variable "network_name" {
  description = "Network Name"
  type        = string
}

variable "allow_ssh_from" {
  description = "Source IP range for SSH access"
  type        = string
}