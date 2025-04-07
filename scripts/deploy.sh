#!/bin/bash

echo "[*] Initializing Terraform..."
terraform init

echo "[*] Validating Terraform..."
terraform validate

echo "[*] Applying Terraform..."
terraform apply -auto-approve
