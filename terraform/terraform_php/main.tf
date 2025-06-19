terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = ">= 3.0.2"
    }
  }
  required_version = ">= 1.3.0"
}

provider "docker" {}

# 🐳 Construction de l'image Docker PHP + Apache + Terraform
resource "docker_image" "php_app" {
  name = "php_terraform_app"

  build {
    context    = abspath("${path.module}/../..")         # -> remonte à php_upscaling/
    dockerfile = abspath("${path.module}/../../Dockerfile")
  }
}

resource "docker_container" "php_app" {
  name  = "php_form"
  image = docker_image.php_app.name

  ports {
    internal = 80
    external = 8181
  }

  # Utilise host_config pour monter les volumes necessaires
  host_config {
    binds = [
      "${abspath("${path.module}/..")}:\/var\/www\/terraform",
      "/var/run/docker.sock:/var/run/docker.sock"
    ]
  }
}

