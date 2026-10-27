variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "eu-west-3"
}

variable "project_name" {
  description = "Project name"
  type        = string
  default     = "aws-lambda"
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "dev"
}