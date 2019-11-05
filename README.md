# aes128-key-rotation

[![Build Status](https://drone.techservices.illinois.edu/api/badges/techservicesillinois/terraform-aws-aes128-key-rotation/status.svg)](https://drone.techservices.illinois.edu/techservicesillinois/terraform-aws-aes128-key-rotation)

Provides a lambda function to generate base64 encoded AES128 keys
for [Secret Manager](https://aws.amazon.com/secrets-manager/).

Argument Reference
-----------------

No arguments are supported.

Attributes Reference
--------------------

The following attributes are exported:

* `qualified_arn` - The Amazon Resource Name (ARN) identifying your
Lambda Function Version.

* `version` - Latest published version of your Lambda Function.

Credits
--------------------

**Nota bene** the vast majority of the verbiage on this page was
taken directly from the Terraform manual, and in a few cases from
Amazon's documentation.
