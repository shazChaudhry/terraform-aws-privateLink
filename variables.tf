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

variable "key_pary_name" {
  default = "personal"
  description = "This is the kay pair name in the selected region"
}

variable "producer_s3_bucket_name" {
  # This must be globally unique bucket name
  default = "privaelink-202907271837"
  description = "Producer is the owner of this bucket with full permisions. Consumer will only be able to read from this bucket"
}
