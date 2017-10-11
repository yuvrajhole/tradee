##Database Worker SERVER

resource "aws_instance" "ec2_db_worker" {
    ami =                   "${lookup(var.ami, "${var.aws_region}_ubuntu_hvm")}"
    instance_type =         "${lookup(var.instance_type, "dbworker")}"
    key_name =              "${var.key_name}"
    monitoring =            true
    source_dest_check =     false
    iam_instance_profile =  "${aws_iam_instance_profile.default_iam_instance_profile.name}"
    subnet_id =             "${aws_subnet.subnet_private_worker1.id}"
	root_block_device {
        volume_type           = "gp2"
        volume_size           = 16
        delete_on_termination = false
    }
    vpc_security_group_ids = [
        "${aws_security_group.sg_worker.id}",
        "${aws_security_group.vsg_base.id}"
    ]

    tags {
        Environment =       "${var.environment}"
        Name =              "${var.environment}_db_worker_a"
#        Version =           "${var.version}"
    }
}


# Outputs

output "DB Worker SSH" {
    value = "ssh -A ${var.ssh_user}@${aws_instance.ec2_db_worker.private_dns}"
}


##PUSH Worker SERVER

resource "aws_instance" "ec2_push_worker" {
    ami =                   "${lookup(var.ami, "${var.aws_region}_ubuntu_hvm")}"
    instance_type =         "${lookup(var.instance_type, "pushworker")}"
    key_name =              "${var.key_name}"
    monitoring =            true
    source_dest_check =     false
    iam_instance_profile =  "${aws_iam_instance_profile.default_iam_instance_profile.name}"
    subnet_id =             "${aws_subnet.subnet_private_worker1.id}"
        root_block_device {
        volume_type           = "gp2"
        volume_size           = 16
        delete_on_termination = false
    }
    vpc_security_group_ids = [
        "${aws_security_group.sg_worker.id}",
        "${aws_security_group.vsg_base.id}"
    ]

    tags {
        Environment =       "${var.environment}"
        Name =              "${var.environment}_push_worker_a"
#        Version =           "${var.version}"
    }
}


# Outputs

output "PUSH Worker SSH" {
    value = "ssh -A ${var.ssh_user}@${aws_instance.ec2_push_worker.private_dns}"
}


##PUSH Worker SERVER

resource "aws_instance" "ec2_uploadimage_worker" {
    ami =                   "${lookup(var.ami, "${var.aws_region}_ubuntu_hvm")}"
    instance_type =         "${lookup(var.instance_type, "uploadimageworker")}"
    key_name =              "${var.key_name}"
    monitoring =            true
    source_dest_check =     false
    iam_instance_profile =  "${aws_iam_instance_profile.default_iam_instance_profile.name}"
    subnet_id =             "${aws_subnet.subnet_private_worker1.id}"
        root_block_device {
        volume_type           = "gp2"
        volume_size           = 16
        delete_on_termination = false
    }
    vpc_security_group_ids = [
        "${aws_security_group.sg_worker.id}",
        "${aws_security_group.vsg_base.id}"
    ]

    tags {
        Environment =       "${var.environment}"
        Name =              "${var.environment}_upload_image_worker_a"
#        Version =           "${var.version}"
    }
}


# Outputs

output "Upload Image Worker SSH" {
    value = "ssh -A ${var.ssh_user}@${aws_instance.ec2_uploadimage_worker.private_dns}"
}

