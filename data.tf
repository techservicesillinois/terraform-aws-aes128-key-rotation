data "aws_region" "current" {}

data "aws_iam_policy_document" "lambda" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type = "Service"

      identifiers = [
        "lambda.amazonaws.com",
      ]
    }
  }
}

# https://github.com/hashicorp/terraform/issues/8204#issuecomment-332239294
# In Terraform v0.12 path.module is "./". In v0.11 it is a full path which
# causes changes when changing paths, even though the hash does not change.
# Further, ignoring filename changes does not help :-(
data "archive_file" "selected" {
  type        = "zip"
  source_file = "./lambda.py"
  output_path = "./lambda.zip"
}
