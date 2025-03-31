terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.2"
    }
  }
}

provider "docker" {}

resource "docker_image" "nginx" {
  name = "nginx:alpine"
}

resource "docker_container" "nginx_container" {
  name  = "web_nginx"
  image = docker_image.nginx.latest
  ports {
    internal = 80
    external = 8080
  }

  volumes {
    host_path      = "${path.module}/../../site"
    container_path = "/usr/share/nginx/html"
  }

  volumes {
    host_path      = "${path.module}/../ansible/nginx.conf"
    container_path = "/etc/nginx/conf.d/default.conf"
  }
}
