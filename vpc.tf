#  Prod-project-VPC
resource "aws_vpc" "Prod-project-VPC" {
  cidr_block           = var.VPC_cidr
  instance_tenancy     = var.VPC_tenancy
  enable_dns_hostnames = var.dns-toggle

  tags = {
    Name = var.vpc_tag
  }
}
#  Prod-project-pub-sub-1
resource "aws_subnet" "Prod-project-pub-sub-1" {
  vpc_id            = aws_vpc.Prod-project-VPC.id
  cidr_block        = var.Prod_pub_sub_1_cidr
  availability_zone = var.AZ-1

  tags = {
    Name = var.Pub-1-tag
  }
}



#  Prod-project-pub-sub-2
resource "aws_subnet" "Prod-project-pub-sub-2" {
  vpc_id            = aws_vpc.Prod-project-VPC.id
  cidr_block        = var.Prod_pub_sub_2_cidr
  availability_zone = var.AZ-2
  tags = {
    Name = var.Pub-2-tag
  }
}

#  Prod-project-priv-sub-1
resource "aws_subnet" "Prod-project-priv-sub-1" {
  vpc_id            = aws_vpc.Prod-project-VPC.id
  cidr_block        = var.Prod_priv_sub_1_cidr
  availability_zone = var.AZ-3
  tags = {
    Name = var.Priv-1-tag
  }
}

#  Prod-project-priv-sub-2
resource "aws_subnet" "Prod-project-priv-sub-2" {
  vpc_id            = aws_vpc.Prod-project-VPC.id
  cidr_block        = var.Prod_priv_sub_2_cidr
  availability_zone = var.AZ-4

  tags = {
    Name = var.Priv-2-tag
  }
}


#  Prod-project-pub-route-table
resource "aws_route_table" "Prod-project-pub-route-table" {
  vpc_id = aws_vpc.Prod-project-VPC.id

  tags = {
    Name = var.Pub-route-table-tag
  }
}


#  Prod-project-priv-route-table
resource "aws_route_table" "Prod-project-priv-route-table" {
  vpc_id = aws_vpc.Prod-project-VPC.id

  tags = {
    Name = var.Priv-route-table-tag
  }
}

#  Prod-project-pub-sub-association
resource "aws_route_table_association" "Prod-project-pub-sub-association-1" {
  subnet_id      = aws_subnet.Prod-project-pub-sub-1.id
  route_table_id = aws_route_table.Prod-project-pub-route-table.id
}

#  Prod-project-pub-sub-association
resource "aws_route_table_association" "Prod-project-pub-sub-association-2" {
  subnet_id      = aws_subnet.Prod-project-pub-sub-2.id
  route_table_id = aws_route_table.Prod-project-pub-route-table.id
}


#  Prod-project-priv-sub-association
resource "aws_route_table_association" "Prod-project-priv-sub-association-1" {
  subnet_id      = aws_subnet.Prod-project-priv-sub-1.id
  route_table_id = aws_route_table.Prod-project-priv-route-table.id
}

#  Prod-project-priv-sub-association
resource "aws_route_table_association" "Prod-project-priv-sub-association-2" {
  subnet_id      = aws_subnet.Prod-project-priv-sub-2.id
  route_table_id = aws_route_table.Prod-project-priv-route-table.id
}

#  Prod-project-IGW
resource "aws_internet_gateway" "Prod-project-IGW" {
  vpc_id = aws_vpc.Prod-project-VPC.id

  tags = {
    Name = var.IGW
  }
}

#  Prod-project-IGW-route
resource "aws_route" "Prod-project-pub-route-table" {
  route_table_id         = aws_route_table.Prod-project-pub-route-table.id
  destination_cidr_block = var.IGW-cidr
  gateway_id             = aws_internet_gateway.Prod-project-IGW.id
}


#  Prod-project-elastic-IP-Address
resource "aws_eip" "Prod-project-VPC-IP" {

}


#  Prod-project-nat-gateway
resource "aws_nat_gateway" "Prod-project-Nat-gateway" {
  allocation_id = aws_eip.Prod-project-VPC-IP.id
  subnet_id     = aws_subnet.Prod-project-pub-sub-1.id

  tags = {
    Name = var.NAT
  }
}

#  Prod-project-Nat-gateway-association
resource "aws_route" "Prod-project-Nat-gateway" {
  gateway_id             = aws_nat_gateway.Prod-project-Nat-gateway.id
  route_table_id         = aws_route_table.Prod-project-priv-route-table.id
  destination_cidr_block = var.Nat-cidr

}


