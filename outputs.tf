output "qualified_arn" {
  value = aws_lambda_function.default.qualified_arn
}

output "version" {
  value = aws_lambda_function.default.version
}
