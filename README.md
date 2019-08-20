# Dockerfile for Ansible

### Dockerfile structure

- gcc musl-dev libffi-dev openssl-dev make in order to install Ansible
- git, openssh for ansible-galaxy to work

- nbering/terraform-inventory for interop between Terraform resources and
  Ansible. This means no hardcoded inventory IPs need to be defined if Terraform
  is used to create those machines.
