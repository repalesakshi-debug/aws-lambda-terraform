variable "project_name" {
  description = "Project name"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "execution_role_arn" {
  description = "IAM role ARN used by Lambda"
  type        = string
}

variable "source_file" {
  description = "Absolute path to Python source file"
  type        = string
}