variable "project_id" {
  description = "The ID of the project in which to provision resources."
  type        = string
}

variable "network_name" {
  description = "The name of the network to attach the firewall to."
  type        = string
}

variable "environment" {
    description = "The environment this is deployed to."
    type = string
}