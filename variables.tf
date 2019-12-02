variable "name" {
  description = "Lambda function name"
  default     = "aes128-key-rot"
}

variable "role" {
  description = "Role name"
  default     = "AWSLambdaSecretManagerRole"
}

variable "policy" {
  description = "Policy name"
  default     = "AWSLambdaSecretManager"
}
