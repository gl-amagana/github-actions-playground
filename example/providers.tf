terraform {
  required_version = "= 1.1.4"

  required_providers {
    aws = {
      version = "~> 3.61.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}