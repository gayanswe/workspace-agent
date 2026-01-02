terraform {
  backend "gcs" {
    bucket = "tf-state-euphoric-effect-479410-a6" # This GCS bucket needs to be created manually once.
    prefix = "terraform/state"
  }
}