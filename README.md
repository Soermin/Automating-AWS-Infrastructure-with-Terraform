🚀 Automating AWS Infrastructure with Terraform
https://github.com/user-attachments/assets/1fdd7b81-69bd-45de-8ac7-7f5edcef2404

📋 Deskripsi
Repository ini berisi konfigurasi Terraform untuk membangun VPC dengan arsitektur 3-tier di 3 Availability Zones (AZ) pada AWS.

🏗️ Komponen
1 VPC (10.1.0.0/16)

3 Public Subnets (a, b, c) dengan akses internet via IGW

3 Private Subnets (a, b, c) dengan akses internet via NAT Gateway

1 Internet Gateway (IGW)

1 NAT Gateway di Public Subnet A

Route Tables (Public & Private) dengan asosiasi yang sesuai

🛠️ Prasyarat
Terraform v1.0+

AWS CLI terkonfigurasi

IAM user dengan akses VPC & EC2

🚀 Cara Penggunaan
bash
# Clone repository
git clone https://github.com/username/Automating-AWS-Infrastructure-with-Terraform.git
cd Automating-AWS-Infrastructure-with-Terraform

# Inisialisasi Terraform
terraform init

# Review rencana
terraform plan

# Apply konfigurasi
terraform apply

# Hapus resource (jika tidak digunakan)
terraform destroy
