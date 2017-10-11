##REDIS Master SERVER

resource "aws_instance" "ec2_redis_master" {
    ami =                   "${lookup(var.ami, "${var.aws_region}_ubuntu_hvm")}"
    instance_type =         "${lookup(var.instance_type, "redis")}"
    key_name =              "${var.key_name}"
    monitoring =            true
    source_dest_check =     false
    iam_instance_profile =  "${aws_iam_instance_profile.default_iam_instance_profile.name}"
    subnet_id =             "${aws_subnet.subnet_private_redis1.id}"
	root_block_device {
        volume_type           = "gp2"
        volume_size           = 20
        delete_on_termination = false
    }
    vpc_security_group_ids = [
        "${aws_security_group.sg_redis.id}",
        "${aws_security_group.vsg_base.id}"
    ]

    tags {
        Environment =       "${var.environment}"
        Name =              "${var.environment}_redis_master"
#        Version =           "${var.version}"
    }
}


# Outputs

output "REDIS MASTER SSH" {
    value = "ssh -A ${var.ssh_user}@${aws_instance.ec2_redis_master.private_dns}"
}


##REDIS SLAVE a SERVER

resource "aws_instance" "ec2_redis_slave_a" {
    ami =                   "${lookup(var.ami, "${var.aws_region}_ubuntu_hvm")}"
    instance_type =         "${lookup(var.instance_type, "redis")}"
    key_name =              "${var.key_name}"
    monitoring =            true
    source_dest_check =     false
    iam_instance_profile =  "${aws_iam_instance_profile.default_iam_instance_profile.name}"
    subnet_id =             "${aws_subnet.subnet_private_redis1.id}"
        root_block_device {
        volume_type           = "gp2"
        volume_size           = 20
        delete_on_termination = false
    }
    vpc_security_group_ids = [
        "${aws_security_group.sg_redis.id}",
        "${aws_security_group.vsg_base.id}"
    ]

    tags {
        Environment =       "${var.environment}"
        Name =              "${var.environment}_redis_slave_a"
#        Version =           "${var.version}"
    }
}


# Outputs

output "REDIS SLAVE a SSH" {
    value = "ssh -A ${var.ssh_user}@${aws_instance.ec2_redis_slave_a.private_dns}"
}


##REDIS SLAVE b SERVER

resource "aws_instance" "ec2_redis_slave_b" {
    ami =                   "${lookup(var.ami, "${var.aws_region}_ubuntu_hvm")}"
    instance_type =         "${lookup(var.instance_type, "redis")}"
    key_name =              "${var.key_name}"
    monitoring =            true
    source_dest_check =     false
    iam_instance_profile =  "${aws_iam_instance_profile.default_iam_instance_profile.name}"
    subnet_id =             "${aws_subnet.subnet_private_redis2.id}"
        root_block_device {
        volume_type           = "gp2"
        volume_size           = 20
        delete_on_termination = false
    }
    vpc_security_group_ids = [
        "${aws_security_group.sg_redis.id}",
        "${aws_security_group.vsg_base.id}"
    ]

    tags {
        Environment =       "${var.environment}"
        Name =              "${var.environment}_redis_slave_b"
#        Version =           "${var.version}"
    }
}


# Outputs

output "REDIS SLAVE b SSH" {
    value = "ssh -A ${var.ssh_user}@${aws_instance.ec2_redis_slave_b.private_dns}"
}
