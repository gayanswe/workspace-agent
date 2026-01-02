provider "google" {
  project = var.project_id
  region  = var.region
}

module "network" {
  source = "./modules/network"

  project_id               = var.project_id
  region                   = var.region
  environment              = var.environment
  project_name             = var.project_name
  vpc_name                 = "${var.environment}-${var.project_name}-vpc-${var.region}"
  subnet_name              = "${var.environment}-${var.project_name}-private-subnet-${var.region}"
  subnet_cidr              = var.subnet_cidr
  github_actions_ip_ranges = var.github_actions_ip_ranges
}