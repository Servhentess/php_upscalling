terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {}

variable "os" {
  type        = string
  description = "Système à déployer"
}

locals {
  os_image = {
    "ubuntu" = "ubuntu:22.04"
    "debian" = "debian:bullseye"
    "centos" = "centos:7"
  }[var.os]
}

resource "docker_image" "vm" {
  name = local.os_image
}

resource "docker_container" "vm" {
  name  = "vm_${var.os}"
  image = docker_image.vm.name
  command = ["tail", "-f", "/dev/null"]
}

