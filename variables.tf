variable "container_name" {
  description = "Name of the container"
  type        = string
  default     = "production_web_server"
}

variable "external_port" {
  description = "External port for the web server"
  type        = number
  default     = 8080
}

variable "nginx_version" {
  description = "Nginx image tag"
  type        = string
  default     = "latest"
}