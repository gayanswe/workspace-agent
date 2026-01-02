provider "google" {
  project = var.project_id
  region  = var.region
}

module "vpc_network" {
  source              = "./modules/vpc"
  project_id          = var.project_id
  region              = var.region
  environment         = var.environment
  project_name_prefix = var.project_name_prefix
  vpc_network_name    = var.vpc_network_name
  subnet_cidr_block   = var.subnet_cidr_block
}

resource "google_compute_firewall" "allow_ssh" {
  name        = "${var.environment}-${var.project_name_prefix}-allow-ssh-${var.region}"
  network     = module.vpc_network.network_self_link
  project     = var.project_id
  description = "Allow SSH access to instances with 'ssh' tag"
  priority    = 1000 # Default priority

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = var.ssh_allowed_ips
  target_tags   = ["ssh"] # Instances must have this tag to receive SSH traffic

  labels = {
    environment = var.environment
    project     = var.project_name_prefix
    managed_by  = "terraform"
    created_by  = "opscontinuum"
  }
}

resource "google_compute_firewall" "allow_egress" {
  name        = "${var.environment}-${var.project_name_prefix}-allow-egress-${var.region}"
  network     = module.vpc_network.network_self_link
  project     = var.project_id
  description = "Allow all egress traffic from the network"
  direction   = "EGRESS"
  priority    = 1000 # Default priority

  allow {
    protocol = "all"
  }

  destination_ranges = ["0.0.0.0/0"]

  labels = {
    environment = var.environment
    project     = var.project_name_prefix
    managed_by  = "terraform"
    created_by  = "opscontinuum"
  }
}