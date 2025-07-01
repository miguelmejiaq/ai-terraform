terraform {
  required_version = ">= 1.0"
  
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region                      = "us-east-1"
  access_key                 = "test"
  secret_key                 = "test"
  s3_use_path_style          = true
  skip_credentials_validation = true
  skip_metadata_api_check    = true
  skip_requesting_account_id = true

  endpoints {
    s3  = "http://localhost:4566"
    sts = "http://localhost:4566"
    iam = "http://localhost:4566"
  }
}

locals {
  environment = "local"
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