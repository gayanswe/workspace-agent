provider "google" {
  project = var.project_id
  region  = var.region
}

module "vpc_network" {
  source                = "./modules/vpc"
  project_id            = var.project_id
  region                = var.region
  environment           = var.environment
  project_name_prefix   = var.project_name_prefix
  vpc_cidr_range        = var.vpc_cidr_range
  subnet_cidr_range     = var.subnet_cidr_range
  private_google_access = true # As per architecture: "VPC with Private Google Access"
}

module "vpc_firewall" {
  source              = "./modules/firewall"
  project_id          = var.project_id
  network_name        = module.vpc_network.vpc_name
  environment         = var.environment
  project_name_prefix = var.project_name_prefix
  subnet_self_link    = module.vpc_network.subnet_self_link
  ssh_source_ranges   = var.ssh_source_ranges
}

module "vpc_cloudnat" {
  source              = "./modules/cloudnat"
  project_id          = var.project_id
  region              = var.region
  network_name        = module.vpc_network.vpc_name
  subnet_self_link    = module.vpc_network.subnet_self_link
  environment         = var.environment
  project_name_prefix = var.project_name_prefix
}