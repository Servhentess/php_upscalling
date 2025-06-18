terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.23"
    }
  }
}

provider "docker" {}

resource "docker_image" "php" {
  name = "php:8-apache"
}

resource "docker_container" "php_app" {
  name  = "php_app"
  image = docker_image.php.latest
  ports {
    internal = 80
    external = 8080
  }
}
