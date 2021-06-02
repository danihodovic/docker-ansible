FROM python:3.9-alpine

RUN apk add --no-cache gcc musl-dev libffi-dev openssl-dev make git openssh curl

# Install ansible dependencies
# hadolint ignore=DL3013
RUN pip install jmespath docker boto3 botocore netaddr

ENV CRYPTOGRAPHY_DONT_BUILD_RUST=1

RUN pip install ansible==4.0.0
