
module "logger_backend" {
  source = "../modules/logger_backend"
  lambda_role_name                       = var.lambda_role_name
  lambda_policy_name                     = var.lambda_policy_name
  lambda_name                            = var.lambda_name
}
