variable "project_id" {
  description = "The ID of the project in which to provision resources."
  type        = string
}

variable "region" {
  description = "The region in which to provision resources."
  type        = string
}

variable "environment" {
    description = "The environment this is deployed to."
    type = string
}

variable "subnet_name" {
  description = "The name of the subnet to enable Cloud NAT for."
  type        = string
}

variable "network_name" {
  description = "The name of the network."
  type        = string
}