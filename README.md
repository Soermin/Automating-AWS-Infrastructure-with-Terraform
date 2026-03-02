# 🚀 Automating AWS Infrastructure with Terraform

Repository ini berisi konfigurasi **Terraform** untuk membangun **VPC 3-tier architecture** di **AWS** dengan 3 Availability Zones (AZ). Infrastruktur ini memudahkan deployment aplikasi yang membutuhkan isolasi jaringan dan skalabilitas.

---
<img width="964" height="694" alt="arsitektur" src="https://github.com/user-attachments/assets/d6a5a11d-8e51-41f4-b56f-c7fc96cfca85" />

## 📋 Deskripsi

Arsitektur ini mencakup:

- 1 VPC dengan CIDR **10.1.0.0/16**
- 3 Public Subnets (a, b, c) dengan akses internet via **Internet Gateway (IGW)**
- 3 Private Subnets (a, b, c) dengan akses internet via **NAT Gateway**
- 1 Internet Gateway
- 1 NAT Gateway di Public Subnet A
- Route Tables untuk Public & Private Subnets dengan asosiasi yang tepat

> Catatan: NAT Gateway menggunakan satu instance, sehingga merupakan single point of failure. 

---

## 🛠️ Prasyarat

Pastikan environment sudah siap:

- Terraform **v1.0+**
- AWS CLI sudah dikonfigurasi
- IAM user dengan akses **VPC & EC2**

---

## 🚀 Cara Penggunaan

```bash
# Clone repository
git clone https://github.com/username/Automating-AWS-Infrastructure-with-Terraform.git
cd Automating-AWS-Infrastructure-with-Terraform

# Inisialisasi Terraform
terraform init

# Review rencana
terraform plan

# Terapkan konfigurasi
terraform apply

# Hapus resource (jika tidak digunakan)
terraform destroy
