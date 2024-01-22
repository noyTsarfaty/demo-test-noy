data "terraform_remote_state" "logger_backend" {
  backend   = "s3"
  config    = {
    bucket         = "cp-account-state-file"
    key            = "account/terraform.tfstate"
    region         = "us-west-2"
    profile        = "cp"
  }
}

resource "github_repository" "github_repo" {
  name        = var.repo_name
  description = "github repo"
  visibility = var.repo_visibility
}

resource "github_repository_webhook" "webhook_github_to_apigw" {
  repository = github_repository.github_repo.name
  configuration {
    url          = data.terraform_remote_state.logger_backend.outputs.api_gateway_invoke_url
    content_type = "application/json"
  }
  active = true
  events = ["pull_request","watch"] //TODO change to when PR is merged
}
