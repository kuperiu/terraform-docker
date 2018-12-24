#!/bin/bash

providers=( "terraform-provider-google" "terraform-provider-google-beta")
versions=( "1.20.0" "1.20.0" )

for ((i=0;i<${#providers[@]};++i)); do
    curl https://releases.hashicorp.com/${providers[i]}/${versions[i]}/${providers[i]}_${versions[i]}_linux_amd64.zip -o ${providers[i]}_${versions[i]}.zip
    unzip ${providers[i]}_${versions[i]}.zip
    rm *.zip
done
docker build . -t kuperiu/terraform:0.11.10
docker push kuperiu/terraform:0.11.10
rm -rf terraform*