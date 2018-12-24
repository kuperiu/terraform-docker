ARG TF_VERSION=0.11.10

FROM hashicorp/terraform:$TF_VERSION
ENV TF_DATA_DIR /root/.terraform
RUN apk add bash
ADD terraform* /root/.terraform/plugins/linux_amd64/
ENTRYPOINT [ "/bin/bash" ]