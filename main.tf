terraform {
  required_version = ">= 1.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.0.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}

module "vpc" {
  source     = "./modules/vpc"
  project_id = var.project_id
  region     = var.region
  vpc_name   = var.vpc_name
  subnet_name = var.subnet_name
  subnet_cidr = var.subnet_cidr
}

module "firewall" {
  source     = "./modules/firewall"
  project_id = var.project_id
  network_name = module.vpc.network_name
  allow_ssh_from = var.allow_ssh_from
}