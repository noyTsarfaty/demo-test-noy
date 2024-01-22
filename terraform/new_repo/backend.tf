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

provider "github" {
  token = "MY_TOKEN" // TODO will be read from secret manager
  //token = data.aws_secretsmanager_secret_version.github_token.secret_string
}

locals{
  repo_name = "bla"
}

terraform {
  backend "s3" {
    bucket         = "cp-account-state-file"
    key            = "repos/terraform.tfstate"
    region         = "us-west-2"
    profile        = "cp"
  }
}

##############################################################################