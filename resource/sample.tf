provider "aws" {
  region = "us-east-1"
}

data "aws_ami" "centos8" {
  most_recent = true
  name_regex  = "Centos-8-DevOps-Practice"
  owners      = ["973714476881"]
}

#create a VPC
resource "aws_vpc" "myvpc"{
cidr_block = "10.0.0.0/16"
  tags = {
    Name = "MyVPC"
  }
}

#2: Create a public subnet
resource "aws_subnet" "PublicSubnet" {
  vpc_id                  = aws_vpc.myvpc.id
  availability_zone       = "us-east-1a"
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  tags                    = {
    Name = "public_subnet"
  }
}

#3 : create a private subnet
resource "aws_subnet" "PrivSubnet"{
  vpc_id = aws_vpc.myvpc.id
  cidr_block = "10.0.2.0/24"
  map_public_ip_on_launch = true

}


#4 : create IGW
resource "aws_internet_gateway" "myIgw"{
  vpc_id = aws_vpc.myvpc.id
}

#5 : route Tables for public subnet
resource "aws_route_table" "PublicRT"{
  vpc_id = aws_vpc.myvpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.myIgw.id
  }
}


#7 : route table association public subnet
resource "aws_route_table_association" "PublicRTAssociation"{
  subnet_id = aws_subnet.PublicSubnet.id
  route_table_id = aws_route_table.PublicRT.id
}

resource "aws_instance" "example" {
  ami           = data.aws_ami.centos8.id
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.PublicSubnet.id

}
