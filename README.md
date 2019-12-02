# aes128-key-rotation

[![Build Status](https://drone.techservices.illinois.edu/api/badges/techservicesillinois/terraform-aws-aes128-key-rotation/status.svg)](https://drone.techservices.illinois.edu/techservicesillinois/terraform-aws-aes128-key-rotation)

Provides a lambda function, IAM role, and policy to generate base64 encoded AES128 keys
for [Secret Manager](https://aws.amazon.com/secrets-manager/). This
may be used with module
[shibd-data-sealer](https://github.com/techservicesillinois/terraform-aws-shibd-data-sealer).

Argument Reference
-----------------

The following arguments are supported:

* `name` - Lambda function name (Default aes128-key-rot).

* `role` - Role name (Default AWSLambdaSecretManagerRole).

* `policy` - Policy name (Default AWSLambdaSecretManager).

Attributes Reference
--------------------

The following attributes are exported:

* `qualified_arn` - The Amazon Resource Name (ARN) identifying your
Lambda Function Version.

* `version` - Latest published version of your Lambda Function.
