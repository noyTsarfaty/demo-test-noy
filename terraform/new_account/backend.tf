###############################################################################
# PROVIDERS
###############################################################################
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region  = var.region
  profile = var.profile
}

terraform {
  backend "s3" {
    bucket         = "cp-account-state-file"
    key            = "account/terraform.tfstate"
    region         = "us-west-2"
    profile        = "cp"
  }
}

##############################################################################