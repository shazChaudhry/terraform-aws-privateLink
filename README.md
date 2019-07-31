# Work in progress
Keep your network traffic within the AWS network; between 2 VPCs and from a VPC and S3. This is all achieved by using private links


## Prerequisites
- Terraform v0.12.3 _(Code has been tested with this version)_
- Create an RSA key (i.e. ~/.ssh/id_rsa) using a third-party tool such as ssh-keygen
- Edit variables.tf to set values are per your need
- Ensure that AWS credentials are available at: "~/.aws/credentials"
```
      [default]
      aws_access_key_id = <KEY>
      aws_secret_access_key = <SECRET_KEY>
      region = <REGION>
```
- Ensure that a unique S3 bucket as a backend type is created. See the docs [here](https://www.terraform.io/docs/backends/types/s3.html)
- Edit values in main.tf as your need liike bucket name and region
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


## Instructions
- `git clone https://github.com/shazChaudhry/terraform-aws-privateLink.git`
- `cd terraform-aws-privateLink`
- `terraform apply -var="producer_public_key=$(ssh-keygen -y -f ~/.ssh/id_rsa)" -auto-approve` _(A public key will be created and passed it to terraform)_
- `eval $(ssh-agent)`
- `ssh-add -k ~/.ssh/id_rsa`
- `ssh-add -l` _(This command should show what keys have been added to the agent)_
- `ssh -A admin@<PRODUCER_PUBLIC_IP>` _(This is the bastion/jump server. You can not ssh to a server in private subnet. Also, ensure your key-pair key is added to ssh agent)_
- `ssh -A admin@<PRODUCER_PRIVATE_IP>` _(This will allow you to ssh to the instance in private subnet that has a route to S3 via privatelink)_
- `aws s3 ls s3://privaelink-202907271837` _(From the producer private instance you should be able to get, put, list and delete s3 objects)_


## Test
Ensure you have SSHed to the private instance via the bastion host:
- `aws s3 ls s3://privaelink-202907271837` _(The bucket should be empty)_
- `touch deleteme.txt` _(create a new blank file that is going to be uploaded to the bucket)_
- `aws s3 cp deleteme.txt s3://privaelink-202907271837/` _(This command uploads the file created above)_
- `aws s3 ls s3://privaelink-202907271837` _(This command should list the file that was uploaded previously)_
See this reference for common commands: https://docs.aws.amazon.com/cli/latest/userguide/cli-services-s3-commands.html


## Cleanup
- `terraform destroy -var="producer_public_key=$(ssh-keygen -y -f ~/.ssh/id_rsa)" -auto-approve`


# Resrouces:
- Overview of Managing Access: https://docs.aws.amazon.com/AmazonS3/latest/dev/access-control-overview.html
- Gateway VPC Endpoints (includes a good diagram): https://docs.aws.amazon.com/vpc/latest/userguide/vpce-gateway.html
- Endpoints for Amazon S3: https://docs.aws.amazon.com/vpc/latest/userguide/vpc-endpoints-s3.html
- IAM Policies and Bucket Policies and ACLs blog: https://aws.amazon.com/blogs/security/iam-policies-and-bucket-policies-and-acls-oh-my-controlling-access-to-s3-resources/
