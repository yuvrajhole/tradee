terraform {
  backend "s3" {
    bucket = "terraform-yuvraj"
    key    = "PROD/terrform.tfstate"
    region = "us-east-1"
  }
}
