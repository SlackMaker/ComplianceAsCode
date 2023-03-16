terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
    }  
  }
}

provider "docker" {
  host = "unix://var/run/docker.sock"
}

variable "docker_image_name" {
  type = string
  default = "openscap"
}

variable "docker_imagem_tag" {
  type = string
  default = "latest"
}

variable "container_name" {
  type = string
  default = "openscap_container"
}

variable = "port" {
  type = string
  default = "22"
}

resource "docker_image" "openscap" {
  name = "${var.docker_image_name}:${var.docker_image_tag}"
  build {
    path       = "/ComplianceAsCode/terraform-openscap"
    dockerfile = "Dockerfile"
    build_arg = {
    }
  }
}

resource "docker_container" "openscap" {
  name  = "${var.container_name}"
  image = "${var.docker_image_name}:${var.docker_image_tag}"
  ports {
    internal = 22
    external = 2222
  }
  depends_on = [
    docker_image.openscap
  ]
  restart = "always"
  env = [
    "TZ=America/Sao_Paulo"
  ]
}
