
terraform {
  required_version = ">= 0.13"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 2.42"
    }
    template = {
      source  = "hashicorp/template"
      version = ">= 2.0"
    }
    local = {
      source  = "hashicorp/local"
      version = ">= 1.3"
    }
    null = {
      source  = "hashicorp/null"
      version = ">= 2.0"
    }
  }
}