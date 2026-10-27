output "lambda_function_name" {
  description = "Deployed Lambda function name"
  value       = module.lambda.function_name
}

output "lambda_function_arn" {
  description = "Deployed Lambda function ARN"
  value       = module.lambda.function_arn
}

output "lambda_execution_role_arn" {
  description = "Lambda execution role ARN"
  value       = module.iam.role_arn
}

output "lambda_cloudwatch_log_group" {
  description = "CloudWatch log group name"
  value       = module.lambda.cloudwatch_log_group
}