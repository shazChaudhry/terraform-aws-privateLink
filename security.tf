module "producer_public_security_group" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "${var.producer}-public-cluster-sg"
  description = "${var.producer} public cluster SG"
  vpc_id      = "${module.producer_vpc.vpc_id}"

  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["ssh-tcp"]
  egress_cidr_blocks  = ["0.0.0.0/0"]
  egress_rules        = ["all-all"]


  tags = {
    Name = "${var.producer}-public-cluster-sg"
  }
}

# module "producer_private_security_group" {
#   source = "terraform-aws-modules/security-group/aws"
#
#   name        = "${var.producer}-private-cluster-sg"
#   description = "${var.producer} private cluster SG"
#   vpc_id      = "${module.producer_vpc.vpc_id}"
#
#   ingress_cidr_blocks = ["0.0.0.0/0"]
#   ingress_rules       = ["ssh-tcp"]
#   egress_cidr_blocks  = ["0.0.0.0/0"]
#   egress_rules        = ["all-all"]
#
#
#   tags = {
#     Name = "${var.producer}-private-cluster-sg"
#   }
# }
