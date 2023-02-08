resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "myvpcexample"
  }
}

resource "aws_subnet" "mypublic_subnet" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "mypublic-example"
  }
}

resource "aws_network_interface" "foo" {
  subnet_id   = aws_subnet.mypublic_subnet.id
  private_ips = ["10.0.1.100"]

  tags = {
    Name = "primary_network_interface"
  }
}

resource "aws_instance" "foo" {
  ami           = "ami-0d03b1ad793d7ac93 "
  instance_type = "t2.micro"

  network_interface {
    network_interface_id = aws_network_interface.foo.id
    device_index         = 0
  }
  credit_specification {
    cpu_credits = "unlimited"
  }
}