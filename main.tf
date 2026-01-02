provider "google" {
  project = var.project_id
  region  = var.region
}

module "network" {
  source = "./modules/network"

  project_id             = var.project_id
  region                 = var.region
  environment            = var.environment
  project_prefix         = var.project_prefix
  vpc_cidr_block         = var.vpc_cidr_block
  subnet_cidr_block      = var.subnet_cidr_block
  subnet_name_suffix     = var.subnet_name_suffix
}

module "firewall" {
  source = "./modules/firewall"

  project_id                 = var.project_id
  environment                = var.environment
  project_prefix             = var.project_prefix
  network_name               = module.network.vpc_name # Pass the actual VPC name from the network module
  subnet_cidr_block          = var.subnet_cidr_block
  ssh_ingress_source_ranges  = var.ssh_ingress_source_ranges
}