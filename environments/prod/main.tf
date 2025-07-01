terraform {
  required_version = ">= 1.0"
  
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    # Configure your S3 backend here
    # bucket = "your-terraform-state-bucket"
    # key    = "prod/terraform.tfstate"
    # region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}

locals {
  environment = "prod"
  common_tags = {
    DeploymentType = "terraform"
    Environment    = local.environment
  }
}

module "s3_bucket" {
  source = "../../modules/s3-bucket"

  bucket_name        = "${var.project_name}-${local.environment}-bucket"
  versioning_enabled = true
  common_tags        = local.common_tags
}