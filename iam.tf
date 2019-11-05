resource "aws_iam_role" "default" {
  name               = "AWSLambdaSecretManagerRole"
  assume_role_policy = data.aws_iam_policy_document.lambda.json
}

resource "aws_iam_role_policy_attachment" "lambda_basic" {
  role       = aws_iam_role.default.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_iam_role_policy_attachment" "default" {
  role       = aws_iam_role.default.name
  policy_arn = aws_iam_policy.default.arn
}

resource "aws_iam_policy" "default" {
  name   = "AWSLambdaSecretManage"
  path   = "/"
  policy = data.aws_iam_policy_document.default.json
}

# https://docs.aws.amazon.com/secretsmanager/latest/userguide/rotating-secrets-required-permissions.html
data "aws_iam_policy_document" "default" {
  statement {
    condition {
      test     = "StringEquals"
      variable = "secretsmanager:resource/AllowRotationLambdaArn"

      values = ["arn:aws:lambda:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:function:${local.function_name}"]
    }

    actions = [
      "secretsmanager:DescribeSecret",
      "secretsmanager:GetSecretValue",
      "secretsmanager:PutSecretValue",
      "secretsmanager:UpdateSecretVersionStage",
    ]

    resources = ["*"]
  }
}
