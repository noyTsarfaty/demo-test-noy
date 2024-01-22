
module "github_repo" {
  source = "../modules/github_repo"
  repo_name                             = var.repo_name
  repo_visibility                       = var.repo_visibility
}
