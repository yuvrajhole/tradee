terraform {
  backend "s3" {
    bucket = "tradee-terraform-tfstate"
    key    = "PROD/terraform.tfstate"
    region = "eu-central-1"
  }
}
