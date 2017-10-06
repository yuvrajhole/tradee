
###EC2 Role
#resource "aws_iam_role" "api_instance_role" {
#    name = "${var.project}_instance_role"
#    path = "/"
#    assume_role_policy = <<EOF
#{
#  "Version": "2012-10-17",
#  "Statement": [
#    {
#      "Sid": "",
#      "Effect": "Allow",
#      "Principal": {
#        "Service": ["ec2.amazonaws.com"]
#      },
#      "Action": "sts:AssumeRole"
#    }
#  ]
#}
#EOF
#}
#
#resource "aws_iam_instance_profile" "iam_instance_profile" {
#    name = "${var.environment}_iam_instance_profile_${var.aws_region}"
#    role = "${aws_iam_role.api_instance_role.name}"
#}
#
#
#data "template_file" "tpl_iamrolepolicy_ec2_api" {
#    template = "${file("${path.module}/resources/policies/EC2ReadOnlyPolicy.json")}"
##    vars {
##        bucket = "${aws_s3_bucket.config_bucket.bucket}"
##    }
#}
#
#resource "aws_iam_role_policy" "iamrole_policy_ec2" {
#    name = "${var.environment}EC2ReadOnlyPolicy"
#    role = "${aws_iam_role.api_instance_role.id}"
#    policy = "${data.template_file.tpl_iamrolepolicy_ec2_api.rendered}"
#}

##Bastion Role
resource "aws_iam_role" "default_instance_role" {
    name = "${var.project}_default_instance_role"
    path = "/"
    assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": ["ec2.amazonaws.com"]
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_instance_profile" "default_iam_instance_profile" {
    name = "${var.environment}_default_iam_instance_profile_${var.aws_region}"
    role = "${aws_iam_role.default_instance_role.name}"
}


#data "template_file" "tpl_iamrolepolicy_ec2_default" {
#    template = "${file("${path.module}/resources/policies/EC2ReadOnlyPolicy.json")}"
##    vars {
##        bucket = "${aws_s3_bucket.config_bucket.bucket}"
##    }
#}
#
#
#resource "aws_iam_role_policy" "default_iamrole_policy_ec2" {
#    name = "${var.environment}DefaultEC2ReadOnlyPolicy"
#    role = "${aws_iam_role.default_instance_role.id}"
#    policy = "${data.template_file.tpl_iamrolepolicy_ec2_default.rendered}"
#}
