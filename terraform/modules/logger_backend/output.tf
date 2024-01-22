#############################################
# OUTPUTS
#############################################

output "lambda_invoke_arn" {
 value = aws_iam_role.lambda_execution_role.arn
}

output "api_gateway_id" {
 value = aws_apigatewayv2_api.logger_api.id
}
//output "github_api_invoke_url" {
//  value = aws_api_gateway_rest_api.github_api.invoke_url
//}
output "github_api_invoke_url" {
  value = aws_apigatewayv2_stage.api_stage.invoke_url
}
