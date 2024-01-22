variable "region" {
  description = "aws region"
  type        = string
}

variable "profile" {
  description = "aws profile"
  type        = string
  default     = "cp"
}

variable "repo_name" {
  description = "Github repository name"
  type        = string
}

variable "repo_visibility" {
  description = "Github repository visibility"
  type        = string
}