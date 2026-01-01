module "vpc" {
  source       = "./modules/vpc"
  project_id   = var.project_id
  region       = var.region
  vpc_name     = var.vpc_name
  subnet_name  = var.subnet_name
  subnet_cidr  = var.subnet_cidr
}

module "firewall" {
  source      = "./modules/firewall"
  project_id  = var.project_id
  network_name = module.vpc.network_name #Reference the output from the VPC module
}

module "cloudnat" {
  source         = "./modules/cloudnat"
  project_id     = var.project_id
  region         = var.region
  network_name   = module.vpc.network_name
  subnet_name = var.subnet_name
}