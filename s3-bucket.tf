module "s3-bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"

  bucket_prefix = "privaelink-"
  acl    = "private"
  versioning_inputs = [
    {
      enabled    = true
      mfa_delete = null
    },
  ]
}
