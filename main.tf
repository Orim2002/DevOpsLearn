terraform {
  backend "s3" {
    bucket = "orima-bucket"
    key = "dev/docker-project/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "terraform-lock-table"
    encrypt = true
  }
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {
    host = "unix:///var/run/docker.sock"
}

resource "docker_image" "nginx_img" {
  name = "nginx:${var.nginx_version}"
  keep_locally = false
}

resource "docker_container" "nginx_srv" {
  image = docker_image.nginx_img.image_id
  name  = "tutorial_server"
  ports {
    internal = 80
    external = var.external_port
  }
}