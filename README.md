# 🔐 GCP Cloud Security Infrastructure (IAM & PAM)

This project implements a secure GCP architecture with Terraform, focusing on Identity and Access Management (IAM) and Privileged Access Management (PAM) best practices. Ideal for training, homelab, or demonstrating cloud security skills.

## 🛠️ Tools & Technologies

- **Terraform** (Infrastructure as Code)
- **Google Cloud Platform (GCP)**
- **Cloud IAM**, **Cloud DNS**, **Cloud VPN**
- **Security Command Center**, **Chronicle SIEM**, **Cloud Logging**
- **Cloud NAT**, **Cloud Armor**, **Firewall Rules**

## 📦 Features Implemented (Phase 1)

- Secure VPC architecture
- IAM roles and service accounts with least privilege
- Terraform remote backend support
- Secrets management integration (coming soon)

## 📁 Project Structure
 ```
  terraform/
  ├── main.tf
  ├── variables.tf
  ├── terraform.tfvars
  ├── outputs.tf
  ├── modules/
  │   └── vpc/
  │       └── main.tf
  └── .gitignore
   ```
## ⚠️ Security Notice
Sensitive files (e.g., terraform.tfvars, credentials) are excluded via .gitignore

Make sure you store secrets securely if you use this in production

## 🧠 Concepts Covered

- GCP IAM roles and service accounts
- Principle of least privilege
- VPC, subnet, firewall, Cloud DNS security
- Cloud VPN setup for hybrid connectivity
- Infrastructure as Code (IaC) best practices

## 📚 Learning Goals
- ✅ Secure cloud network design
- ✅ IAM/PAM enforcement with Terraform
- ✅ Real-world GCP tools usage (SCC, Chronicle, SIEM)

👤 Created by Sabri
