resource "docker_image" "myimage" {
  name = "${var.image_name}"
}
variable "image_name" {
    description = "image for container"
  
}
output "image_out" {
  value = "${docker_image.myimage.latest}"
}

resource "docker_container" "container_id" {
  name = "${var.container_name}"
  image = "${var.image}"
  ports {
      internal = "${var.int_port}"
      external = "${var.ext_port}"
  }
}

module "image" {
  source = "./modules/image"
  image_name = "${var.myimage}"
}
module "container" {
  source = "./modules/container"
  image = "${module.image.image_out}"
  container_name = "${var.container_name}"
  int_port = "${var.int_port}"
  ext_port = "${var.ext_port}"
}

variable "container_name" {
  description = "name of the container"
  default = "wezva"
}
variable "myimage" {
  description = "image for container"
  default = "nginx:latest"
}
variable "int_port" {
  description = "internal port for container"
  default = "80"
}
variable "ext_port" {
  description = "external port for container"
  default = "80"
}