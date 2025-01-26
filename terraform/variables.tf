variable "docker_host" {
  description = "The Docker host"
  type        = string
  default     = "unix:///var/run/docker.sock"
}

variable "vpc_network_name" {
  description = "The VPC Docker network"
  type        = string
  default     = "mkhouse-vpc-net"
}

variable "rabbitmq_network_name" {
  description = "The RabbitMQ Docker network"
  type        = string
  default     = "mkhouse-rabbit-net"
}

variable "rabbitmq_default_user" {
  description = "The RabbitMQ default user"
  type        = string
}

variable "rabbitmq_default_pass" {
  description = "The RabbitMQ default password"
  type        = string
}

variable "mkhouse_volume_basepath" {
  description = "The base path fo Docker volumes at MK House"
  type        = string
  default     = "/mkh/srv/mkhouse"
}

variable "rabbitmq-data_volume_name" {
  description = "The RabbitMQ data Docker volume"
  type        = string
  default     = "mkhouse-rabbitmq-data"
}

variable "rabbitmq-data_volume_path" {
  description = "The RabbitMQ data Docker volume"
  type        = string
  default     = "${mkhouse_volume_basepath}/rabbitmq-data"
}

variable "docker_compose_file" {
  description = "The path to the docker-compose.yml file"
  type        = string
  default     = "../docker/docker-compose.yml"
}
