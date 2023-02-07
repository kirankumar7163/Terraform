#step1 create a VPC
resource "aws_vpc" "myvpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "myterraformVPC"
  }
}
#step2 create a public subnet
resource "aws_subnet" "public_subnet" {
  vpc_id = aws_vpc.myvpc.id
  cidr_block = "10.0.1.0/24"
}
#step3 create a private subnet
resource "aws_subnet" "private_subnet" {
  vpc_id = aws_vpc.myvpc.id
  cidr_block = "10.0.2.0/24"
}
#step4 create a IGW
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.myvpc.id
}
#step5 create a route table for public subnet
resource "aws_route_table" "publicRT" {
  vpc_id = aws_vpc.myvpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "aws_internet_gateway.igw.id"
  }
}

#step6 routbetable associateion with public subnet
resource "aws_route_table_association" "publicRT_association" {
    subnet_id = aws_subnet.public_subnet.id
    route_table_id = aws_route_table.publicRT.id
}