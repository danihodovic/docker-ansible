FROM python:3.7-alpine

RUN apk add --no-cache gcc musl-dev libffi-dev openssl-dev make git

# hadolint ignore=DL3013
RUN pip install jmespath docker boto3 botocore

RUN pip install ansible==2.7
