# https://registry.terraform.io/modules/terraform-aws-modules/s3-bucket/aws
module "privaelink_s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket        = "${var.producer_s3_bucket_name}"
  acl           = "private"
  force_destroy = true

  # # TODO: Error putting S3 logging: InvalidTargetBucketForLogging: You must give the log-delivery group WRITE and READ_ACP permissions to the target bucket
  # logging_inputs = [
  #   {
  #     target_bucket = "privaelink-202907271837"
  #     target_prefix = "log/"
  #   },
  # ]

  request_payer = "Requester"

  # server_side_encryption_configuration_inputs =

  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Deny",
            "Principal": {
                "AWS": "${aws_iam_role.producer_asg_role.arn}"
            },
            "Action": [
                "s3:GetObject",
                "s3:ListBucket",
                "s3:DeleteObject",
                "s3:PutObject"
            ],
            "Resource": ["${local.s3_buckets}"],
            "Condition": {
                "StringNotEquals": {
                    "aws:sourceVpce": "${aws_vpc_endpoint.producer_endpoint_gateway_to_s3.id}"
                }
            }
        }
    ]
}
POLICY
  tags = {
    Terraform = "true"
    Name      = "privaelink-s3-bucket"
  }
}
