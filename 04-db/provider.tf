terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.62.0"
    }
  }
  backend "s3" {
    bucket = "chetanakatta"
    key    = "expense-infra-dev-db"
    region = "us-east-1"
    dynamodb_table = "daws-78s-locking"
  }
}

#provide authentication here
provider "aws" {
  region = "us-east-1"
}