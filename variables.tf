variable "aws_region" {
    type = string
    default = "eu-central-1"
}

variable "aws_AMI" {
    type = string
    default = "ami-01376afa3e7def694"
}

variable "aws_VPC_cidr" {
    type = string
    default = "10.0.0.0/16"
}

variable "aws_Subnet1_cidr" {
    type = string
    default = "10.0.1.0/24"
}

variable "aws_Subnet2_cidr" {
    type = string
    default = "10.0.2.0/24"
}

variable "aws_Subnet3_cidr" {
    type = string
    default = "10.0.3.0/24"
}

variable "aws_Subnet4_cidr" {
    type = string
    default = "10.0.4.0/24"
}

variable "aws_instance_type" {
    type = string
    default = "t3.micro"
}

variable "aws_private_route_table_cidr" {
    type = string
    default = "0.0.0.0/0"
}

variable "aws_public_route_table_cidr" {
    type = string
    default = "0.0.0.0/0"
}
