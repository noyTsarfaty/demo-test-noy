
data "archive_file" "zip_the_python_code" {
 type        = "zip"
 source_dir  = "${path.module}/scripts/"
 output_path = "${path.module}/scripts/lambda_function.zip"
}

resource "aws_lambda_function" "terraform_lambda_func" {
  function_name    = var.lambda_name
  role             = aws_iam_role.lambda_execution_role.arn
  handler          = "lambda_function.lambda_handler"
  runtime          = "python3.9"
  timeout          = 3
  memory_size      = 128
  filename         = "${path.module}/scripts/lambda_function.zip"
  tracing_config {
    mode = "PassThrough"
  }
  depends_on       = [aws_iam_role_policy_attachment.attach_iam_policy_to_iam_role]
}


# IAM Role for Lambda
resource "aws_iam_role" "lambda_execution_role" {
 name   = var.lambda_role_name
 assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_policy" "iam_policy_for_lambda" {
  name         = var.lambda_policy_name
  path         = "/"
  description  = "AWS IAM Policy for managing aws lambda role"
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [ "logs:CreateLogGroup",
                  "logs:CreateLogStream",
                  "logs:PutLogEvents"
      ],
      "Resource": "arn:aws:logs:*:*:*",
      "Effect": "Allow"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "attach_iam_policy_to_iam_role" {
  role        = aws_iam_role.lambda_execution_role.name
  policy_arn  = aws_iam_policy.iam_policy_for_lambda.arn
}

#######################################################
################### API GW creation ###################
#######################################################
resource "aws_apigatewayv2_api" "logger_api" {
  name          = "noy-test"
  protocol_type = "HTTP"
}

resource "aws_apigatewayv2_route" "api_route" {
  api_id    = aws_apigatewayv2_api.logger_api.id
  route_key = "POST /github_post"  # Format: "<HTTP METHOD> /<RESOURCE PATH>"
  target    = "integrations/${aws_apigatewayv2_integration.api_lambda_integration.id}"
}

resource "aws_apigatewayv2_stage" "api_stage" {
  api_id      = aws_apigatewayv2_api.logger_api.id
  name        = "$default"
  auto_deploy = true
}

resource "aws_apigatewayv2_integration" "api_lambda_integration" {
  api_id                    = aws_apigatewayv2_api.logger_api.id
  integration_type          = "AWS_PROXY"
  connection_type           = "INTERNET"
  description               = "Lambda integration with API GW"
  integration_method        = "POST"
  integration_uri           = aws_lambda_function.terraform_lambda_func.arn
  passthrough_behavior      = "WHEN_NO_MATCH"
  depends_on = ["aws_apigatewayv2_api.logger_api", "aws_apigatewayv2_stage.api_stage", "aws_apigatewayv2_route.api_route"]
}