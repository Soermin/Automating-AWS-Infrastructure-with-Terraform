Automating AWS Infrastructure with Terraform
https://github.com/user-attachments/assets/1fdd7b81-69bd-45de-8ac7-7f5edcef2404

Konfigurasi Terraform untuk membuat VPC dengan 3 public subnet dan 3 private subnet di 3 Availability Zones (ap-southeast-3a, 3b, 3c) lengkap dengan Internet Gateway dan NAT Gateway.

Komponen
VPC: 10.1.0.0/16

3 Public Subnet: 10.1.1.0/24, 10.1.2.0/24, 10.1.3.0/24

3 Private Subnet: 10.1.11.0/24, 10.1.12.0/24, 10.1.13.0/24

Internet Gateway

NAT Gateway (di Public Subnet A)

Route tables (public & private)

Cara Penggunaan
bash
terraform init
terraform plan
terraform apply
Catatan
NAT Gateway akan dikenakan biaya per jam

Jalankan terraform destroy jika infrastruktur tidak lagi digunakan
