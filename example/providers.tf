terraform {
  required_version = "= 1.0.8"
  backend "local" {}
  required_providers {
    aws = {
      version = "~> 3.61.0"
    }
  }
}
