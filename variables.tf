
variable "version" {
    default = "1.0.0"
    description = "The version of TF"
}

variable "environment"      { default = "PROD"   description = "ENV" }
variable "project"          { default = "TRADEE"   description = "PROJECT" }
variable "aws_account_id"   { default = "123456789012" description = "replace with your aws account id" }
variable "aws_account_name" { default = "electron" description = "replace with your aws account name" }


#VPC
variable "vpc"              { default = "10.1.0.0/16"   description = "Main VPC" }
variable "blaze_dmz"        { default = "10.1.10.0/24"  description = "DMZ Subnet" }
variable "blaze_dmz2"       { default = "10.1.20.0/24"  description = "DMZ Subnet" }
variable "blaze_a"          { default = "10.1.11.0/24"  description = "Blaze api Subnet A" }
variable "blaze_a1"         { default = "10.1.21.0/24"  description = "Blaze api Subnet A1" }
variable "blaze_b"          { default = "10.1.12.0/24"  description = "Blaze elasticsearch Subnet B" }
variable "blaze_b1"         { default = "10.1.22.0/24"  description = "Blaze elasticsearch Subnet B1" }
variable "blaze_c"          { default = "10.1.13.0/24"  description = "Blaze worker Subnet C" }
variable "blaze_c1"         { default = "10.1.23.0/24"  description = "Blaze worker Subnet C1" }
variable "blaze_d"          { default = "10.1.14.0/24"  description = "Blaze rds Subnet D" }
variable "blaze_d1"         { default = "10.1.24.0/24"  description = "Blaze rds Subnet D1" }
variable "blaze_e"          { default = "10.1.15.0/24"  description = "Blaze rdsreplica Subnet E" }

#Region & Availability Zones
#variable "aws_region"       { default = "us-east-1"  description = "PROD region 1" }
variable "aws_region"       { default = "eu-central-1"  description = "PROD region 2" }
variable "az_1"             { default = "eu-central-1a"  description = "PROD az 1" }
variable "az_2"             { default = "eu-central-1b"  description = "PROD az 2" }
variable "az_3"             { default = "eu-central-1c"  description = "PROD az 3" }

#variable "az_1"             { default = "us-east-1a"  description = "PROD az 1" }
#variable "az_2"             { default = "us-east-1b"  description = "PROD az 2" }

##AMI

variable "ami" {
    default = {
        us-east-1_amz_hvm =       "ami-5e8c9625" # Amazon Linux AMI 2017.09.rc-0.20170913 x86_64 HVM GP2
        eu-central-1_ubuntu_hvm =    "ami-1e339e71" # ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-20170721
        }
    description = "Latest Available AWS AMIs"
}


##Instance Type
variable "instance_type" {
    default = {
        bastion =   "t2.micro"
        api =       "t2.micro"
    }
    description = "AWS instance type (must be compatible with corresponding AMI)"
}

##Key Pair
variable "key_name"      { default = "201710tradeekey"  description = "Create and Download the mentioned key before applying" }

variable "ssh_user"      { default = "ubuntu"   description = "ssh user" }

##ALB Certificate ARN

variable "web_ssl_certificate_id" { default =  "arn:aws:iam::187416307283:server-certificate/test_cert_rab3wuqwgja25ct3n4jdj2tzu4"}


### ASGs

variable "min_cluster_size_api"          { default = "0"   description = "min_size" }
variable "desired_cluster_size_api"      { default = "0"   description = "desired" }
variable "max_cluster_size_api"          { default = "0"   description = "max_size" }

variable "health_check_grace_period"     { default = "300"   description = "health_check_grace_period" }
variable "health_check_type"             { default = "EC2"   description = "EC2/ELB" }
