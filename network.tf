resource "aws_vpc" "inalambrica-vpc" {
  cidr_block           = var.CIDR
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "vpc_inalambricas"

  }
}

resource "aws_subnet" "inalambricas-private-subnet" {
  vpc_id                  = aws_vpc.inalambricas-vpc.id
  cidr_block              = var.subnet
  map_public_ip_on_launch = "true"
  tags = {
    Name = "inalambricas-subnet"
  }
}

resource "aws_internet_gateway" "inalambricas-gateway" {
  vpc_id = aws_vpc.inalambricas-vpc.id
  tags = {
    Name = "inalambricas-gateway"
  }
}

resource "aws_default_route_table" "inalambricas-route" {
  default_route_table_id = aws_vpc.inalambricas-vpc.default_route_table_id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.inalambricas-gateway.id
  }
  tags = {
    Name = "inalambricas-default-route"
  }
}
