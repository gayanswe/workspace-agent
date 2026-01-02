terraform {
  backend "gcs" {
    bucket = "euphoric-effect-479410-a6-tfstate"
    prefix = "terraform/state"
  }
}
