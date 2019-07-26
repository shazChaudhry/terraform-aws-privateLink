# Work in progress
Keep your network traffic within the AWS network; between 2 VPCs and from a VPC and S3. This is all achieved by using private links


## Prerequisites
- Terraform v0.12.3 _(Code has been tested with this version)_
- Ensure that AWS credentials are available at: "~/.aws/credentials" on the host dev machine
```
      [default]
      aws_access_key_id = <KEY>
      aws_secret_access_key = <SECRET_KEY>
      region = <REGION>
```
- Ensure that a S3 bucket as a backend type is created. See the docs [here](https://www.terraform.io/docs/backends/types/s3.html)
```
      terraform {
        # It is expected that the bucket, globally unique, already exists
        backend "s3" {
          # you will need a globally unique bucket name
          bucket  = "<BUCKET_NAME>"
          key     = "<KEY>.tfstate"
          region  = "<REGION>"
          encrypt = true
        }
      }
```

# Instructions
- `git clone https://github.com/shazChaudhry/terraform-aws-privateLink.git`
- `cd terraform-aws-privateLink`
- `terraform apply -auto-approve `


# Resrouces:
- https://docs.aws.amazon.com/vpc/latest/userguide/vpc-endpoints-s3.html
- https://medium.com/tensult/creating-vpc-endpoint-for-amazon-s3-using-terraform-7a15c840d36f
