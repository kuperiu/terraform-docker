#!/bin/bash

tf_version="0.11.11"
providers=( "terraform-provider-google" "terraform-provider-google-beta")
versions=( "1.20.0" "1.20.0" )

for ((i=0;i<${#providers[@]};++i)); do
    curl https://releases.hashicorp.com/${providers[i]}/${versions[i]}/${providers[i]}_${versions[i]}_linux_amd64.zip -o ${providers[i]}_${versions[i]}.zip
    unzip ${providers[i]}_${versions[i]}.zip
    rm *.zip
done
docker build --build-arg ${tf_version} . -t kuperiu/terraform:${tf_version} 
docker push kuperiu/terraform:${tf_version}
rm -rf terraform*