variable "aws_region" {
  type = string
}

variable "credentials_profile" {
  type        = string
  description = "The AWS credentials profile to use"
}

variable "environment" {
  type        = string
  description = "AWS Environment"
}
