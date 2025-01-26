data "external" "check_vpc_network" {
  program = ["bash", "-c", "docker network inspect ${var.vpc_network_name} >/dev/null 2>&1 && echo '{\"exists\": \"true\"}' || echo '{\"exists\": \"false\"}'"]
}

data "external" "check_rabbitmq_network" {
  program = ["bash", "-c", "docker network inspect ${var.rabbitmq_network_name} >/dev/null 2>&1 && echo '{\"exists\": \"true\"}' || echo '{\"exists\": \"false\"}'"]
}

resource "null_resource" "create_vpc_network" {
  count = data.external.check_vpc_network.result.exists == "true" ? 0 : 1

  provisioner "local-exec" {
    command = "docker network create --driver bridge ${var.vpc_network_name}"
  }
}

resource "null_resource" "create_rabbitmq_network" {
  count = data.external.check_rabbitmq_network.result.exists == "true" ? 0 : 1

  provisioner "local-exec" {
    command = "docker network create --driver bridge ${var.rabbitmq_network_name}"
  }
}
