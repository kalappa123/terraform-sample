provider "github" {
organization = "wezvatechnologies"
}
data "github_repository" "example" {
    full_name = "scmlearningcentre/maven"
}
data "github_repositories" "example" {
  query = "scmlearningcentre/is:public"
}
output "repolist" {
  value = "${data.github_repositories.example.full_names}"
}

variable "enable_usercreation" {
  description = "enable or disable user creation"
  
}
resource "aws_iam_user" "example" {
  count = var.enable_usercreation ? 1 : 0
  name = "adam"
}