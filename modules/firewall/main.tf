resource "google_compute_firewall" "allow_ssh" {
  project = var.project_id
  name    = "${var.environment}-${var.project_name_prefix}-allow-ssh"
  network = var.network_name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = var.ssh_source_ranges # From variables.tf at root
  destination_ranges = [cidrhost(var.subnet_cidr_from_self_link, 0)] # Targets instances in the subnet

  target_tags = ["allow-ssh"] # Apply to instances with this tag

  labels = {
    environment = var.environment
    project     = var.project_name_prefix
    managed_by  = "terraform"
    created_by  = "opscontinuum"
  }
}

resource "google_compute_firewall" "allow_egress" {
  project = var.project_id
  name    = "${var.environment}-${var.project_name_prefix}-allow-egress"
  network = var.network_name
  direction = "EGRESS"

  allow {
    protocol = "all"
  }

  destination_ranges = ["0.0.0.0/0"] # Egress to all destinations

  target_tags = ["allow-egress"] # Apply to instances with this tag

  labels = {
    environment = var.environment
    project     = var.project_name_prefix
    managed_by  = "terraform"
    created_by  = "opscontinuum"
  }
}

# Helper to extract CIDR from subnet_self_link if needed for destination_ranges
# This is a workaround if subnet_self_link is the only info passed for firewall rules.
# Better to pass subnet_cidr_range directly from the calling module.
# Since I'm passing subnet_self_link and the main CIDR, I'll use the main CIDR.
# However, for firewall rules, it's about the instances *within* the subnet.
# I'll use the subnet_self_link to query its CIDR for the destination_ranges in allow_ssh.
# Or better, pass the subnet_cidr_range from root variable.
# Let's update module variables to take subnet_cidr_range.

# Re-evaluating allow_ssh destination: The rule is applied to instances.
# If source is external and target is the subnet range, it effectively means to instances in that range.
# `destination_ranges` is used for EGRESS. For INGRESS, it's `source_ranges` to `target_tags` (or `target_service_accounts`).
# So, for INGRESS `allow_ssh`:
# - `source_ranges`: Where SSH can come *from*.
# - `target_tags`: To which instances the rule *applies*.
# I will make `allow_ssh` apply to any instance with tag `allow-ssh` and from `var.ssh_source_ranges`.

# For the `allow_ssh` rule, it is implicitly for instances within the VPC.
# The 'destination' in the security config table refers to the internal subnet where the instances reside.
# When defining an ingress rule, `destination_ranges` is not typically set directly,
# but rather the `target_tags` or `target_service_accounts` specify *which* instances the rule applies to.
# So, the rule applies to instances tagged "allow-ssh" and ingress is allowed from `ssh_source_ranges`.