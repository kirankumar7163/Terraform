data "aws_ami" "example" {
  most_recent = true
  name_regex  = "Centos-8-DevOps-Practice"
  owners      = ["973714476881"]
}

output "aws_ami" {
  valuve = data.aws_ami.example
}

data "aws_instance" "foo" {
  instance_id = "i-0bca86a8aaae7a742"

}

output "aws_instance" {
  value = data.aws_instance.foo.public_ip
}