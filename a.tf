provider "aws" {
    region = "us-east-2"
}
terraform {
    backend "s3"{
        bucket ="wezva-adam-demo-s3"
        key = "default/terraform.tfstate"
        region = "us-east-2"
    }
}
resource "aws_s3_bucket" "example" {
  bucket = "wezva-adam-demo-s3"
}