//
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region  = "us-west-2"
  profile = "cp"
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "cp-account-state-file"
  acl    = "private"
  //acl    = "public-read-write"
}

//resource "aws_secretsmanager_secret" "github_token" {
//  name = "github_token"
//}
//
//resource "aws_secretsmanager_secret_version" "my_secret_version" {
//  secret_id     = aws_secretsmanager_secret.github_token.id
//  secret_string = "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"
//}
//
