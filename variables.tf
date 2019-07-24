variable "region" {
  description = "AWS London region to launch servers"
  default     = "eu-west-2"
}

variable "credentials" {
  default     = "~/.aws/credentials"
  description = "Profiles containing aws_access_key_id and aws_secret_access_key"
}

variable "producer" {
  default     = "producer"
  description = "Producer VPC name"
}

variable "consumer" {
  default     = "consumer"
  description = "Consumer VPC name"
}
