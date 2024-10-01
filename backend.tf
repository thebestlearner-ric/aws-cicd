terraform {
  backend "s3" {
    bucket = "terraform-cloud-bucket"
    key    = "terraform/state"
    region = "us-west-2"
  }
}

provider "aws" {
  region = "us-west-2"
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "terraform-cloud-bucket"

  versioning {
    enabled = true
  }
}
