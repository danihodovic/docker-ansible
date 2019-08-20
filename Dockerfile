FROM python:3.7-alpine

RUN apk add --no-cache gcc musl-dev libffi-dev openssl-dev make git openssh curl

# Install nbering/terraform-inventory
RUN curl -L https://github.com/nbering/terraform-provider-ansible/releases/download/v1.0.3/terraform-provider-ansible-linux_amd64.zip -o /tmp/terraform-ansible.zip && \
	mkdir -p /root/.terraform.d/plugins && \
	unzip /tmp/terraform-ansible.zip -d /tmp/ && \
	cp /tmp/linux_amd64/terraform-provider-ansible_v1.0.3 /root/.terraform.d/plugins/ && \
	rm -rf /tmp/linux_amd64 /tmp/terraform-ansible.zip

RUN curl -L https://raw.githubusercontent.com/nbering/terraform-inventory/v2.2.0/terraform.py -o /usr/local/bin/terraform.py && \
	chmod +x /usr/local/bin/terraform.py

# Install ansible dependencies
# hadolint ignore=DL3013
RUN pip install jmespath docker boto3 botocore netaddr

# Install terraform
RUN curl -L https://releases.hashicorp.com/terraform/0.12.6/terraform_0.12.6_linux_amd64.zip -o /tmp/terraform.zip && \
	unzip /tmp/terraform.zip -d /usr/local/bin/ && \
	rm /tmp/terraform.zip

RUN pip install ansible==2.8.4
