provider "aws" {
    region = "us-ease-2"
}
data "aws_instances" "test" {
  filter {
    name = "instance.group-id"
    values = ["sg-0704ac5542e704b03"]
  }
  filter {
    name = "instance_type"
    values = ["t2.micro","t2.small"]
  }
  instance_state_names = ["running", "stopped"]
}
provider "aws" {
  region = "us-east-2"
} 
variable "user_names" {
  description = "create TAM users with these names"
  type = list(string)
  default = [ "adam","intel","lenovo" ]
  
}
resource "aws_iam_user" "example" {
  count = length(var.user_names)
  name = var.user_names[count.index]
}
resource "aws_iam_user" "example" {
  for_each = toset(var.user_names)
  name = each.value
}
 variable "names" {
   description = "A list of names"
   type = list(string)
   default = [ "intel","IAM","lenovo","hp" ]
 }
 output "upper_names" {
   value = [for name in var.names : upper(name)]
 }










