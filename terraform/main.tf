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
  name = "php_app"
  build {
    context    = "${path.module}/.."
    dockerfile = "${path.module}/../Dockerfile"
  }
}

resource "docker_container" "php_app" {
  name  = "php_app"
  image = docker_image.php.name
  ports {
    internal = 80
    external = 8181
    ip       = "0.0.0.0"
  }

  depends_on = [docker_image.php]
}
