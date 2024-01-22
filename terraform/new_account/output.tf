#############################################
# OUTPUTS
#############################################

output "lambda_invoke_arn" {
  value = module.logger_backend.lambda_invoke_arn
}

output "api_gateway_invoke_url" {
  value = module.logger_backend.github_api_invoke_url
}

output "api_gateway_id" {
  value = module.logger_backend.api_gateway_id
}
