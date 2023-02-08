resource "aws_instance" "ubuntu" {
  ami           = "ami-00149760ce42c967b"
  instance_type = "t3.micro"

  tags = {
    Name = "HelloWorld"
  }
}