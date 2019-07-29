# See Amazon EC2 Key Pairs: https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html
resource "aws_key_pair" "deployer" {
  key_name   = "id_rsa"
  # Import Your own public key to Amazon EC2
  public_key = "${var.public_key}"
}
