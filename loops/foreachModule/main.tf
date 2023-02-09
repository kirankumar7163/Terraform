variable "components" {
  default = {
    cart = {
      name          = "cart",
      instance_type = "t3.small"
    }
    catalogue = {
      name          = "catalogue",
      instance_type = "t3.micro"
    }
  }
}

module "vpc" {
  source = "./module"

  for_each      = var.components
  instance_type = each.value.instance_type
  name          = each.value.name
}


## Always iterate modules, not resources.
## Always map the data and use for_each loop

output "publicip" {
  value = {
    for k, v in module.ec2 : k => v["ec2"].public_ip
  }
}