
variable "region" {
  description = "aws region"
  type        = string
}

variable "profile" {
  description = "aws profile"
  type        = string
  default     = "cp"
}

variable "lambda_role_name" {
  description = "lambda role name"
  type        = string
}

variable "lambda_name" {
  description = "lambda name"
  type        = string
}

variable "lambda_policy_name" {
  description = "lambda policy name"
  type        = string
}

