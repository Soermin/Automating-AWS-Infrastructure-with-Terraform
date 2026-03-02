# 🚀 Automating AWS Infrastructure with Terraform

This repository contains Terraform configurations to provision a 3-tier VPC architecture on AWS across 3 Availability Zones (AZs). The infrastructure is designed to support applications that require network isolation, scalability, and structured deployment environments.

---
<img width="964" height="694" alt="arsitektur" src="https://github.com/user-attachments/assets/d6a5a11d-8e51-41f4-b56f-c7fc96cfca85" />

## 📋 Description

This architecture includes:
- 1 VPC with CIDR block 10.1.0.0/16
- 3 Public Subnets (a, b, c) with internet access via Internet Gateway (IGW)
- 3 Private Subnets (a, b, c) with outbound internet access via NAT Gateway
- 1 Internet Gateway
- 1 NAT Gateway deployed in Public Subnet A
- Properly configured Route Tables for both Public and Private Subnets

Note: The NAT Gateway is deployed as a single instance, which introduces a single point of failure.

---

## 🛠️ Prerequisites

Make sure your environment is properly configured:
- Terraform v1.0+
- AWS CLI configured with valid credentials
- IAM user with VPC & EC2 permissions

---

## 🚀 Usage

```bash
# Clone the repository
git clone https://github.com/username/Automating-AWS-Infrastructure-with-Terraform.git
cd Automating-AWS-Infrastructure-with-Terraform

# Initialize Terraform
terraform init

# Review execution plan
terraform plan

# Apply configuration
terraform apply

# Destroy resources (if no longer needed)
terraform destroy

```

## ⚠️ Important Notes
- NAT Gateway incurs hourly charges plus Elastic IP (EIP) costs.
- Run terraform destroy when resources are not in use to avoid unnecessary charges.
- Default region: ap-southeast-3 (Jakarta)

## 📚 References
- AWS VPC Documentation
- Terraform AWS Provider
