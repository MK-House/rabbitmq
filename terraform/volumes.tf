data "external" "check_rabbitmq-data_volume" {
  program = ["bash", "-c", "docker volume inspect ${var.rabbitmq-data_volume_name} >/dev/null 2>&1 && echo '{\"exists\": \"true\"}' || echo '{\"exists\": \"false\"}'"]
}

resource "null_resource" "create_rabbitmq_data_directory" {
  provisioner "local-exec" {
    command = "mkdir -p ${local.rabbitmq_data_volume_path}"
  }
}

resource "null_resource" "create_rabbitmq_data_volume" {
  provisioner "local-exec" {
    command = "docker volume create --name ${var.rabbitmq-data_volume_name} --opt type=none --opt device=${local.rabbitmq_data_volume_path} --opt o=bind"
  }
  depends_on = [
    data.external.check_rabbitmq-data_volume,
    null_resource.create_rabbitmq_data_directory
  ]
}
