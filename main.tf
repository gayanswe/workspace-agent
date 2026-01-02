provider "google" {
  project = var.project_id
  region  = var.region
}

module "vpc" {
  source = "./modules/vpc"

  project_id          = var.project_id
  region              = var.region
  environment         = var.environment
  project_name_prefix = var.project_name_prefix
  subnet_ip_cidr_range = var.subnet_ip_cidr_range
}

module "firewall" {
  source = "./modules/firewall"

  project_id               = var.project_id
  vpc_network_name         = module.vpc.network_name
  subnet_ip_cidr_range     = var.subnet_ip_cidr_range
  ssh_ingress_source_ranges = var.ssh_ingress_source_ranges
  ssh_target_tags          = var.ssh_target_tags
  firewall_priority        = var.firewall_priority
  environment              = var.environment
  project_name_prefix      = var.project_name_prefix
  region                   = var.region
}

module "nat" {
  source = "./modules/nat"

  project_id          = var.project_id
  region              = var.region
  vpc_network_name    = module.vpc.network_name
  subnet_self_link    = module.vpc.subnet_self_link
  environment         = var.environment
  project_name_prefix = var.project_name_prefix
}