terraform {
  backend "s3" {
    bucket         = "ckpo-terraform-state"
    key            = "myproject"
    dynamodb_table = "ckpo-terraform-state-lock"
    region         = "us-east-1"
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
      Environment = "ckpo"
      Owner       = "Monty van Emmerik"
      Project     = "My Project"
      IaC         = "Terraform"
      Platform    = "amazon"
      Created     = timestamp()
    }
  }
}