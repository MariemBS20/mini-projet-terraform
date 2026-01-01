terraform {
  required_version = "1.14.3"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.61.0"

    }
    tls = {
      source  = "hashicorp/tls"
      version = "4.0.4"
    }
    local = {
      source  = "hashicorp/local"
      version = "2.4.0"
    }
    template = {
      source  = "hashicorp/template"
      version = "2.2.0"
    }
  }
}
provider "aws" {
  region = "eu-west-2"
  skip_credentials_validation = true
  skip_requesting_account_id  = true

}