provider "google" {
  project = var.project_id
  region  = var.region
}

module "vpc_network" {
  source = "./modules/vpc"

  project_id         = var.project_id
  region             = var.region
  environment        = var.environment
  project_short_name = var.project_short_name
  subnet_cidr        = var.subnet_cidr
}

module "firewall_rules" {
  source = "./modules/firewall"

  project_id                 = var.project_id
  environment                = var.environment
  project_short_name         = var.project_short_name
  network_name               = module.vpc_network.network_name
  client_ip_ssh_source_range = var.client_ip_ssh_source_range
}