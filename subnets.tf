# DMZ

resource "aws_subnet" "subnet_public_dmz" {
    vpc_id = "${aws_vpc.vpc_blaze.id}"
    cidr_block = "${var.blaze_dmz}"
    availability_zone = "${var.az_1}"
    map_public_ip_on_launch = true

    tags {
        Name = "${var.environment}-Public-1a"
        Environment = "${var.environment}"
#        Version = "${var.version}"
    }
}

resource "aws_subnet" "subnet_public_dmz2" {
    vpc_id = "${aws_vpc.vpc_blaze.id}"
    cidr_block = "${var.blaze_dmz2}"
    availability_zone = "${var.az_2}"
    map_public_ip_on_launch = true

    tags {
        Name = "${var.environment}-Public-1b"
        Environment = "${var.environment}"
#        Version = "${var.version}"
    }
}



# Private Subnets

resource "aws_subnet" "subnet_private_api1" {
    vpc_id = "${aws_vpc.vpc_blaze.id}"
    cidr_block = "${var.blaze_a}"
    availability_zone = "${var.az_1}"

    tags {
        Name = "${var.environment}-applicationapi-1a"
        Environment = "${var.environment}"
#        Version = "${var.version}"
    }
}

resource "aws_subnet" "subnet_private_api2" {
    vpc_id = "${aws_vpc.vpc_blaze.id}"
    cidr_block = "${var.blaze_a1}"
    availability_zone = "${var.az_2}"

    tags {
        Name = "${var.environment}-applicationapi-1b"
        Environment = "${var.environment}"
#        Version = "${var.version}"
    }
}

resource "aws_subnet" "subnet_private_elasticsearch1" {
    vpc_id = "${aws_vpc.vpc_blaze.id}"
    cidr_block = "${var.blaze_b}"
    availability_zone = "${var.az_1}"

    tags {
        Name = "${var.environment}-elasticsearch"-1a"
        Environment = "${var.environment}"
#        Version = "${var.version}"
    }
}

resource "aws_subnet" "subnet_private_elasticsearch2" {
    vpc_id = "${aws_vpc.vpc_blaze.id}"
    cidr_block = "${var.blaze_b1}"
    availability_zone = "${var.az_2}"

    tags {
        Name = "${var.environment}-elasticsearch"-1b"
        Environment = "${var.environment}"
#        Version = "${var.version}"
    }
}


resource "aws_subnet" "subnet_private_worker1" {
    vpc_id = "${aws_vpc.vpc_blaze.id}"
    cidr_block = "${var.blaze_c}"
    availability_zone = "${var.az_1}"

    tags {
        Name = "${var.environment}-worker-1a"
        Environment = "${var.environment}"
#        Version = "${var.version}"
    }
}

resource "aws_subnet" "subnet_private_worker2" {
    vpc_id = "${aws_vpc.vpc_blaze.id}"
    cidr_block = "${var.blaze_c1}"
    availability_zone = "${var.az_2}"

    tags {
        Name = "${var.environment}-worker-1b"
        Environment = "${var.environment}"
#        Version = "${var.version}"
    }
}

resource "aws_subnet" "subnet_private_rds1" {
    vpc_id = "${aws_vpc.vpc_blaze.id}"
    cidr_block = "${var.blaze_d}"
    availability_zone = "${var.az_1}"

    tags {
        Name = "${var.environment}-rds-1a"
        Environment = "${var.environment}"
#        Version = "${var.version}"
    }
}

resource "aws_subnet" "subnet_private_rds2" {
    vpc_id = "${aws_vpc.vpc_blaze.id}"
    cidr_block = "${var.blaze_d1}"
    availability_zone = "${var.az_2}"

    tags {
        Name = "${var.environment}-rds-1b"
        Environment = "${var.environment}"
#        Version = "${var.version}"
    }
}

resource "aws_subnet" "subnet_private_rdsrr" {
    vpc_id = "${aws_vpc.vpc_blaze.id}"
    cidr_block = "${var.blaze_e}"
    availability_zone = "${var.az_3}"

    tags {
        Name = "${var.environment}-subnet-rdsreplica"
        Environment = "${var.environment}"
#        Version = "${var.version}"
    }
}
