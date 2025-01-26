resource "null_resource" "docker_compose_pull" {
  provisioner "local-exec" {
    command = "docker compose -f ${var.docker_compose_file} pull"
  }
  depends_on = [
      null_resource.create_vpc_network,
      null_resource.create_rabbitmq_network
    ]
}

resource "null_resource" "docker_compose_up" {
  provisioner "local-exec" {
    command = <<EOT
    RABBITMQ_DEFAULT_USER=${var.rabbitmq_default_user} \
    RABBITMQ_DEFAULT_PASS=${var.rabbitmq_default_pass} \
    docker compose -f ${var.docker_compose_file} up -d --force-recreate --remove-orphans --build
    EOT
  }
  depends_on = [null_resource.docker_compose_pull]
}

resource "null_resource" "docker_image_prune" {
  provisioner "local-exec" {
    command = "docker image prune --force"
  }
  depends_on = [null_resource.docker_compose_up]
}
