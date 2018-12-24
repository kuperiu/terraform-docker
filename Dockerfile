FROM hashicorp/terraform:0.11.10
ENV TF_DATA_DIR /root/.terraform
RUN apk add bash
ADD terraform* /root/.terraform/plugins/linux_amd64/
ENTRYPOINT [ "/bin/bash" ]