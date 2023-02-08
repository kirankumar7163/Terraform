
resource "aws_instance" "example" {
  ami           = "ami-0a017d8ceb274537d"
  instance_type = "t2.micro"
  subnet_id     = "172.31.0.0/24"
  }