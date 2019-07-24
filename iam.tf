resource "aws_iam_instance_profile" "producer_asg_profile" {
  name_prefix = "${var.producer}-profile-"
  role        = "${aws_iam_role.producer_asg_role.name}"
}

resource "aws_iam_role" "producer_asg_role" {
  name_prefix         = "${var.producer}-asg-role-"
  description         = "Role to assume when launching ASG"
  path                = "/system/"
  assume_role_policy  = "${data.aws_iam_policy_document.ec2_assume_role_policy.json}"
  tags = {
    Name = "${var.producer}-asg-role"
  }
}

resource "aws_iam_role_policy_attachment" "administratorAccess_iam_role_policy_attachment" {
  role = "${aws_iam_role.producer_asg_role.name}"
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}
