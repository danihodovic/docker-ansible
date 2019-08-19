FROM python:3.7-alpine

RUN apk add --no-cache gcc musl-dev libffi-dev openssl-dev make git openssh curl

# Install terraform-inventory
RUN curl -L https://github.com/adammck/terraform-inventory/releases/download/v0.9/terraform-inventory_0.9_linux_amd64.zip -o /tmp/tf-inventory.zip && \
	unzip /tmp/tf-inventory.zip -d /usr/local/bin/ && \
	rm /tmp/tf-inventory.zip

# Install ansible dependencies
# hadolint ignore=DL3013
RUN pip install jmespath docker boto3 botocore netaddr

# Install terraform
RUN curl -L https://releases.hashicorp.com/terraform/0.12.6/terraform_0.12.6_linux_amd64.zip -o /tmp/terraform.zip && \
	unzip /tmp/terraform.zip -d /usr/local/bin/ && \
	rm /tmp/terraform.zip

RUN pip install ansible==2.8.4
