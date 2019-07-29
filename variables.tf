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

variable "public_key" {
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC55B4jf69uWPr8rai7hKcghbO0rS5sv7sUt59Mk9GnEQlso4ZY7wcTJbv9ebxvWzHREvtBYRFasnFcfOv4rsdP3IrN509OyqjojSzQBrS76Oe+DnUSJQklJgtxBjG3NYh/vUCoh7NSeYSc+wOaT1TqXs5y6pyiwDB43OTtOu0r+iwsUs2JG1WRbFSyjakldlZ8z4GanKd0TMx65wTwoyvDbbx/GkSHqp4vC0uZSgDlUKvNPyDPLqGmZ1rRtJgCucACLeGjGuSp6jC1FFyg2SooHtERtPfN+dy74ezmxl2y/i+cJypyXFWewhPahwVw/Kae+f/LjG7NIRTGWio+LXYEKN9qeT+dR+akr96PpLx6r6iof8YXx4RrF4d/7cTiuNM0kanUu2sE3a+es/HnbjvUbbkQwvPASVHh7O0dBVbTSsrcIzD1l/aJbTWFNvEPvfEyFYixWH1xzTMtJqKGym8RILEaJ3BIJZB36eYwvROGwAxtGWQfR/PcTLViJhxfgm8TMpZmOmzqnavg1dkBOTt8ZCw06mfQqB5DjrBY6m1SoEfH3rfgBneUJD7Bgp10VXFkbYPAMMjxZwL/wuEsI8/jU9ctkeLLF3GdBYfQPyK9VuLXo52G4FzR1T7KPendxHKgdO7IpxOfpsWbn4V1/nbueiPyCayunqUAQ9RtzeUK4Q=="
  description = "Import Your own public key to Amazon EC2"
}
