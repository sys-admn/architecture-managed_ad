resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr_block
  enable_dns_support = true
  enable_dns_hostnames = true

    tags = {
    Name = "Core-network"
  }
}

resource "aws_subnet" "public" {
  count = var.public_subnet_count
  vpc_id = aws_vpc.main.id
  cidr_block = cidrsubnet(var.vpc_cidr_block, 8, count.index)
  map_public_ip_on_launch = true
   tags = {
    Name = "public-subnet-${count.index + 1}"
  }
  
}

resource "aws_subnet" "private" {
  count = var.private_subnet_count
  vpc_id = aws_vpc.main.id
  cidr_block = cidrsubnet(var.vpc_cidr_block, 8, count.index + var.public_subnet_count)
  availability_zone = element(var.availability_zones, count.index)
  tags = {
    Name = "private-subnet-${count.index + 1}"
  }
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "igw-main"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }
   tags = {
    Name = "rt-public"
  }
}

resource "aws_route_table_association" "public" {
  count = var.public_subnet_count
  subnet_id = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id
   tags = {
    Name = "rt-private"
  }
}

resource "aws_route_table_association" "private" {
  count = var.private_subnet_count
  subnet_id = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private.id
}
