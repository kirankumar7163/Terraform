variable "sample" {
  default = 10
}

output "sample" {
  value = var.sample
}

#datatyppes
#we have 3 types string data, booleandata, numberdata

#string data type
variable "sample1" {
  default = "hi this is kiran"
}

#numberdatatype
variable "sample2" {
  default = 100
}

#booleandatatype
variable "sample3" {
  default = false
}

#list of variable type
#1 default variable type
#2 list variable type
#3 mapping variable type

variable "sample4" {
  default = "hi kiran"
}

output "sample4" {
  value = var.sample4
}

#list variable type
variable "sample5" {
  default = [
    101,
    "kiran",
    "pravalika"
  ]
}

output "sample5" {
  value = var.sample5[2]
}

#mapping variable

variable "sample6" {
  default = {
    number = 100
    string = "kiran pravalika"
    boolean = true
  }
}

output "sample6" {
  value = var.sample6["number"]

}

#terraform.tfvar

variable "demo1" {}
output "demo1" {
  value = var.demo1
  }
