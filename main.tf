
# Konfigurasi Membuat VPC
resource "aws_vpc" "main" {
  cidr_block            = "10.1.0.0/16"
  enable_dns_hostnames  = true
  enable_dns_support    = true

  tags = {
    Name = "main-vpc"
  }
}


#Konfigurasi Subnet Public
resource "aws_subnet" "public_a" {
  vpc_id = aws_vpc.main.id
  cidr_block = "10.1.1.0/24"
  availability_zone = "ap-southeast-3a"
  map_public_ip_on_launch = true

  tags = {
    Name = "public_a"
  }
}

resource "aws_subnet" "public_b" {
  vpc_id = aws_vpc.main.id
  cidr_block = "10.1.2.0/24"
  availability_zone = "ap-southeast-3b"
  map_public_ip_on_launch = true

  tags = {
    Name = "public_b"
  }
}

resource "aws_subnet" "public_c" {
  vpc_id = aws_vpc.main.id
  cidr_block = "10.1.3.0/24"
  availability_zone = "ap-southeast-3c"
  map_public_ip_on_launch = true

  tags = {
    Name = "public_c"
  }
}

#Konfigurasi Private Subnet
resource "aws_subnet" "private_a" {
  vpc_id = aws_vpc.main.id
  cidr_block = "10.1.11.0/24"
  availability_zone = "ap-southeast-3a"

  tags = {
    Name = "private_a"
  }
}

resource "aws_subnet" "private_b" {
  vpc_id = aws_vpc.main.id
  cidr_block = "10.1.12.0/24"
  availability_zone = "ap-southeast-3b"

  tags = {
    Name = "private_b"
  }
}

resource "aws_subnet" "private_c" {
  vpc_id = aws_vpc.main.id
  cidr_block = "10.1.13.0/24"
  availability_zone = "ap-southeast-3c"

  tags = {
    Name = "private_c"
  }
}

#Konfigurasi IGW
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main-igw"
  }
}


#Konfigurasi Route Table Untuk Publick Subnet
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "public-route-table"
  }
}

#Associate Route Table ke Public Subnet
resource "aws_route_table_association" "public_a" {
  subnet_id = aws_subnet.public_a.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_b" {
  subnet_id = aws_subnet.public_b.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_c" {
  subnet_id = aws_subnet.public_c.id
  route_table_id = aws_route_table.public.id
}


#Konfigurasi NAT Gateway
resource "aws_eip" "nat_eip" {
  domain = "vpc"

  tags = {
    Name = "nat-eip"
  }
}


#NAT Gateway pada Public Subnet A
resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id = aws_subnet.public_a.id

  tags = {
    Name = "main-nat"
  }

  depends_on = [ aws_internet_gateway.igw ]
}

#Private Route Table
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat.id
  }

  tags = {
    Name = "private-route-table"
  }
}

#Associate Private Subnet ke Private Route Table
resource "aws_route_table_association" "private_a" {
  subnet_id = aws_subnet.private_a.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private_b" {
  subnet_id = aws_subnet.private_b.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private_c" {
  subnet_id = aws_subnet.private_c.id
  route_table_id = aws_route_table.private.id
}
