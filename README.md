# RabbitMQ Deployment

This repository contains the configuration and scripts to deploy RabbitMQ using Ansible. The strategy for this instance is to share RabbitMQ between applications on the same host and create virtual hosts (vhosts) for each new application.

## Getting Started

### Prerequisites

- Ansible
- A self-hosted runner for GitHub Actions
- Necessary environment variables and secrets configured in GitHub

### Deployment

To deploy RabbitMQ, simply push changes to the `main` branch. The GitHub Actions workflow will automatically run and deploy RabbitMQ using the provided Ansible playbook.

### Environment Variables

The following environment variables need to be set:

- `ANSIBLE_PROJECT`: Path to the Ansible project
- `RABBITMQ_PROJECT`: Path to the RabbitMQ project
- `RABBITMQ_DEFAULT_USER`: Default RabbitMQ user
- `RABBITMQ_DEFAULT_PASS`: Default RabbitMQ password (stored as a GitHub secret)
- `CF_ACCOUNT_ID`: Cloudflare account ID (stored as a GitHub secret)
- `CF_TUNNEL_API_TOKEN`: Cloudflare tunnel API token (stored as a GitHub secret)
- `CF_TUNNEL_NAME`: Cloudflare tunnel name
- `CF_SERVICE`: Cloudflare service
- `CF_HOSTNAME`: Cloudflare hostname

### Strategy

The strategy for this RabbitMQ instance is to share it between multiple applications running on the same host. Each application will have its own virtual host (vhost) within RabbitMQ, ensuring isolation and proper resource management.

## Contributing

Contributions are welcome! Please open an issue or submit a pull request with your changes.

## License

This project is licensed under the [MIT License](./LICENSE).
