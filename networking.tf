terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
  provider "aws" {
    region = var.aws_region
  }


resource "aws_vpc" "my_first_vpc" {
    cidr_block = var.aws_VPC_cidr
    tags = {
        Name = "My_First_VPC"
    }
}

resource "aws_internet_gateway" "my_first_internet_gateway" {
    vpc_id = aws_vpc.my_first_vpc.id

    tags = {
        Name = "VPC_Internet_Gateway"
    }
}

resource "aws_subnet" "practice_subnet1" {
    vpc_id            = aws_vpc.my_first_vpc.id
    cidr_block        = var.aws_Subnet1_cidr

    tags = {
        Name = "private_subnet1"
    }
}

resource "aws_subnet" "practice_subnet2" {
    vpc_id            = aws_vpc.my_first_vpc.id
    cidr_block        = var.aws_Subnet2_cidr

    tags = {
        Name = "private_subnet2"
    }
}

resource "aws_subnet" "practice_subnet3" {
    vpc_id            = aws_vpc.my_first_vpc.id
    cidr_block        = var.aws_Subnet3_cidr

    tags = {
        Name = "public_subnet1"
    }
}

resource "aws_subnet" "practice_subnet4" {
    vpc_id            = aws_vpc.my_first_vpc.id
    cidr_block        = var.aws_Subnet4_cidr


    tags = {
        Name = "public_subnet2"
    }
}

resource "aws_instance" "public_instance1" {
    ami = var.aws_AMI
    instance_type = var.aws_instance_type
    subnet_id = aws_subnet.practice_subnet3.id
    associate_public_ip_address = true

    tags = {
        Name = "public_instance1"
    }
}

resource "aws_instance" "private_instance1" {
    ami = var.aws_AMI
    instance_type = var.aws_instance_type
    subnet_id = aws_subnet.practice_subnet1.id

    tags = {
        Name = "private_instance1"
    }
}

resource "aws_instance" "public_instance2" {
    ami = var.aws_AMI
    instance_type = var.aws_instance_type
    subnet_id = aws_subnet.practice_subnet4.id
    associate_public_ip_address = true


    tags = {
        Name = "public_instance2"
    }
}

resource "aws_instance" "private_instance2" {
    ami = var.aws_AMI
    instance_type = var.aws_instance_type
    subnet_id = aws_subnet.practice_subnet2.id

    tags = {
        Name = "private_instance2"
    }
}

resource "aws_eip" "My_First_Elastic_Ip" {
  domain   = "vpc"

  tags = {
    Name = "My_First_Elastic_IP"
  }
}

resource "aws_nat_gateway" "my_nat_gateway1" {
  allocation_id = aws_eip.My_First_Elastic_Ip.id
  subnet_id     = aws_subnet.practice_subnet3.id
}


resource "aws_route_table" "my_first_public_route_table" {
    vpc_id = aws_vpc.my_first_vpc.id

    route {
        cidr_block = var.aws_public_route_table_cidr
        gateway_id = aws_internet_gateway.my_first_internet_gateway.id
    }

    tags = {
        Name = "Route_Table_Public"
    }
}

resource "aws_route_table" "my_first_private_route_table" {
    vpc_id = aws_vpc.my_first_vpc.id

    route {
        cidr_block = var.aws_private_route_table_cidr
        nat_gateway_id = aws_nat_gateway.my_nat_gateway1.id
    }

    tags = {
        Name = "Route_Table_Private"
    }
}

resource "aws_route_table_association" "public_route_association1" {
  subnet_id      = aws_subnet.practice_subnet3.id
  route_table_id = aws_route_table.my_first_public_route_table.id
}

resource "aws_route_table_association" "public_route_association2" {
  subnet_id      = aws_subnet.practice_subnet4.id
  route_table_id = aws_route_table.my_first_public_route_table.id
}

resource "aws_route_table_association" "private_route_association1" {
  subnet_id      = aws_subnet.practice_subnet1.id
  route_table_id = aws_route_table.my_first_private_route_table.id
}

resource "aws_route_table_association" "private_route_association2" {
  subnet_id      = aws_subnet.practice_subnet2.id
  route_table_id = aws_route_table.my_first_private_route_table.id
}

