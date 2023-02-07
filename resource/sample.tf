provider "aws" {
  region = "us-east-1"
}

data "aws_ami" "centos8" {
  most_recent = true
  name_regex  = "Centos-8-DevOps-Practice"
  owners      = ["973714476881"]

}

resource "aws_instance" "web" {
  ami           = data.aws_ami.centos8.id
  instance_type = "t3.micro"

  tags = {
    Name = "testing"
  }
}

resource "aws_subnet" "my_subnet" {
  vpc_id            = 'aws_vpc.04018a37c2a1f4629.id'
  cidr_block        = "172.31.0.0/16"
  availability_zone = "us-east-1a"

}