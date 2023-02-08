resource "aws_instance" "web" {
  ami           = "ami-0d03b1ad793d7ac93"
  instance_type = "t3.micro"

  tags = {
    Name = "HelloWorld"
  }
}