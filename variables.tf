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
  description = "Name of the VPC (e.g., dev-project-vpc-region)"
  type        = string
  default     = "dev-newproject-vpc-us-east4"
}

variable "subnet_name" {
  description = "Name of the private subnet (e.g., dev-project-subnet-region)"
  type        = string
  default     = "dev-newproject-subnet-us-east4"
}

variable "subnet_cidr" {
  description = "CIDR range for the private subnet"
  type        = string
  default     = "10.0.4.0/24"
}

variable "ssh_firewall_name" {
  description = "Name for the Ingress SSH firewall rule"
  type        = string
  default     = "dev-newproject-allow-ssh"
}

variable "egress_firewall_name" {
  description = "Name for the Egress All firewall rule"
  type        = string
  default     = "dev-newproject-allow-egress"
}

variable "nat_router_name" {
  description = "Name for the Cloud Router used by NAT"
  type        = string
  default     = "dev-newproject-router-us-east4"
}

variable "nat_name" {
  description = "Name for the Cloud NAT gateway"
  type        = string
  default     = "dev-newproject-nat-us-east4"
}