# Terraform Backend Configuration
# Using local state (stored in repo) for simplicity
# For production, configure a remote backend (GCS, S3, etc.)

terraform {
  # Local backend - state stored in terraform.tfstate file
  # No remote storage required
}
