terraform {
  backend "gcs" {
    bucket = "gs://euphoric-effect-479410-a6-tfstate" # Replace with your bucket name
    prefix = "terraform/state"
  }
}