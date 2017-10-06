#######
##VPC##
#######


resource "aws_vpc" "vpc_blaze" {
    cidr_block = "${var.vpc}"
    enable_dns_support = true
    enable_dns_hostnames = true
    tags {
        Name = "${var.environment}_vpc"
        Environment = "${var.environment}"
#        Version = "${var.version}"
    }
}


### Elastic IPs (for NAT Gateways)

resource "aws_eip" "elastic_ip_nat_gw" {
    vpc = true
}

resource "aws_eip" "elastic_ip_bastion_host" {
    vpc = true
}

### Internet Gateways

resource "aws_internet_gateway" "igw_blaze" {
    vpc_id = "${aws_vpc.vpc_blaze.id}"

    tags {
        Name = "${var.environment}_igw"
        Environment = "${var.environment}"
#        Version = "${var.version}"
    }
}


resource "aws_nat_gateway" "nat_gateway_a" {
    allocation_id = "${aws_eip.elastic_ip_nat_gw.id}"
    subnet_id = "${aws_subnet.subnet_public_dmz.id}"
    depends_on = [
        "aws_internet_gateway.igw_blaze",
        "aws_eip.elastic_ip_nat_gw"
    ]
}

#resource "aws_nat_gateway" "nat_gateway_b" {
#    allocation_id = "${aws_eip.elastic_ip_nat_gw1.id}"
#    subnet_id = "${aws_subnet.subnet_public_dmz2.id}"
#    depends_on = [
#        "aws_internet_gateway.igw_blaze",
#        "aws_eip.elastic_ip_nat_gw"
#    ]
#}

### Outputs

output "VPC ID " {
    value = "${aws_vpc.vpc_blaze.id}"
}
