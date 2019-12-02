resource "aws_lambda_function" "default" {
  function_name = var.name
  description   = "Generate random AES 128 keys"
  handler       = "lambda.lambda_handler"
  publish       = true

  role    = aws_iam_role.default.arn
  runtime = var.runtime

  filename         = data.archive_file.selected.output_path
  source_code_hash = data.archive_file.selected.output_base64sha256

  environment {
    variables = {
      SECRETS_MANAGER_ENDPOINT = "https://secretsmanager.${data.aws_region.current.name}.amazonaws.com"
    }
  }
}

# https://docs.aws.amazon.com/secretsmanager/latest/userguide/rotating-secrets-required-permissions.html
resource "aws_lambda_permission" "allow_secrets_manager" {
  statement_id = "AllowExecutionFromSecretsManager"

  principal = "secretsmanager.amazonaws.com"
  action    = "lambda:InvokeFunction"

  function_name = aws_lambda_function.default.function_name
}
