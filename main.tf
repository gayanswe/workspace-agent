provider "google" {
  project = var.project_id
  region  = var.region
}

module "vpc" {
  source       = "./modules/vpc"
  project_id   = var.project_id
  region       = var.region
  environment  = var.environment
  vpc_name     = var.vpc_name
  subnet_cidr  = var.subnet_cidr
  subnet_name  = var.subnet_name
}

module "firewall" {
  source      = "./modules/firewall"
  project_id  = var.project_id
  network_name = module.vpc.network_name
  environment = var.environment
}

module "cloudnat" {
  source          = "./modules/cloudnat"
  project_id      = var.project_id
  region          = var.region
  environment     = var.environment
  subnet_name     = module.vpc.subnet_name
  network_name    = module.vpc.network_name
}