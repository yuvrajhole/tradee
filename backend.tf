terraform {
  backend "s3" {
    bucket = "terraform-yuvrajh"
    key    = "PROD/terraform.tfstate"
    region = "us-east-1"
  }
}
