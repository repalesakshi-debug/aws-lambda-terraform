output "role_arn" {
  description = "IAM execution role ARN"
  value       = aws_iam_role.this.arn
}

output "role_name" {
  description = "IAM execution role name"
  value       = aws_iam_role.this.name
}