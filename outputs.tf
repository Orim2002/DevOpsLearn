output "container_id" {
  value = docker_container.nginx_srv.id
}

output "web_url" {
  value = "http://localhost:${var.external_port}"
}