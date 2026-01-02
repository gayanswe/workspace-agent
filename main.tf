provider "google" {
  project = var.project_id
  region  = var.region
}

locals {
  # Naming convention: {env}-{project}-{resource}-{region}
  vpc_name               = "${var.environment}-${var.project_name}-vpc-${var.region}"
  private_subnet_name    = "${var.environment}-${var.project_name}-private-subnet-${var.region}"
  firewall_ssh_name      = "${var.environment}-${var.project_name}-allow-ssh-github"
  firewall_egress_name   = "${var.environment}-${var.project_name}-egress-all"
}

module "vpc_network" {
  source = "./modules/vpc"

  project_id        = var.project_id
  region            = var.region
  environment       = var.environment
  project_name      = var.project_name
  vpc_name          = local.vpc_name
  vpc_cidr_range    = var.vpc_cidr_range
  subnet_name       = local.private_subnet_name
  subnet_cidr_range = var.subnet_cidr_range
}

module "firewall_rules" {
  source = "./modules/firewall"

  project_id                   = var.project_id
  environment                  = var.environment
  project_name                 = var.project_name
  vpc_network_name             = module.vpc_network.vpc_name
  firewall_ssh_name            = local.firewall_ssh_name
  firewall_egress_name         = local.firewall_egress_name
  github_ci_cd_source_ranges   = var.github_ci_cd_source_ranges
}