##API SERVER

resource "aws_instance" "ec2_api" {
    ami =                   "${lookup(var.ami, "${var.aws_region}_ubuntu_hvm")}"
    instance_type =         "${lookup(var.instance_type, "api")}"
    key_name =              "${var.key_name}"
    monitoring =            true
    source_dest_check =     false
    iam_instance_profile =  "${aws_iam_instance_profile.default_iam_instance_profile.name}"
    subnet_id =             "${aws_subnet.subnet_private_api1.id}"
	root_block_device {
        volume_type           = "gp2"
        volume_size           = 50
        delete_on_termination = false
    }
    vpc_security_group_ids = [
        "${aws_security_group.sg_api.id}",
        "${aws_security_group.vsg_base.id}"
    ]

    tags {
        Environment =       "${var.environment}"
        Name =              "${var.environment}_api_server_a"
#        Version =           "${var.version}"
    }
}


# Outputs

output "API SSH" {
    value = "ssh -A ${var.ssh_user}@${aws_instance.ec2_api.private_dns}"
}
