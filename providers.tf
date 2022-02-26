terraform {
  backend "s3" {
    bucket = "ckpo-terraform-state"
    key    = "myproject"
    region = "us-east-1"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.2.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  default_tags {
    tags = {
      Environment = "Production"
      Owner       = "Monty van Emmerik"
      Project     = "My Project"
      IaC         = "Terraform"
      Platform    = "amazon"
      Created     = timestamp()
    }
  }
}