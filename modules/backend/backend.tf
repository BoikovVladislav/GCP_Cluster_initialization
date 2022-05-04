terraform {
  backend "gcs" {
    bucket = "terraform_whatizlove_bucket"
    prefix = "/terraform/state"
  }
}
