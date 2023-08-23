#  Prod-project-VPC
resource "aws_vpc" "Prod-project-VPC" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "Prod-project-VPC"
  }
}
#  Prod-project-pub-sub-1
resource "aws_subnet" "Prod-project-pub-sub-1" {
  vpc_id     = aws_vpc.Prod-project-VPC.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "Prod-project-pub-sub-1"
  }
}



#  Prod-project-pub-sub-2
resource "aws_subnet" "Prod-project-pub-sub-2" {
  vpc_id     = aws_vpc.Prod-project-VPC.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "Prod-project-pub-sub-2"
  }
}

#  Prod-project-priv-sub-1
resource "aws_subnet" "Prod-project-priv-sub-1" {
  vpc_id     = aws_vpc.Prod-project-VPC.id
  cidr_block = "10.0.3.0/24"

  tags = {
    Name = "Prod-project-priv-sub-1"
  }
}

#  Prod-project-priv-sub-2
resource "aws_subnet" "Prod-project-priv-sub-2" {
  vpc_id     = aws_vpc.Prod-project-VPC.id
  cidr_block = "10.0.4.0/24"

  tags = {
    Name = "Prod-project-priv-sub-2"
  }
}


#  Prod-project-pub-route-table
resource "aws_route_table" "Prod-project-pub-route-table"  {                       
  vpc_id = aws_vpc.Prod-project-VPC.id

  tags  = {
   Name = "Prod-project-pub-route-table"
  }
} 


#  Prod-project-priv-route-table
resource "aws_route_table" "Prod-project-priv-route-table"  {                       
  vpc_id = aws_vpc.Prod-project-VPC.id

  tags  = {
   Name = "Prod-project-priv-route-table"
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
    Name ="Prod-project-VPC"
  }
}

#  Prod-project-IGW-route
resource "aws_route" "Prod-project-pub-route-table" {
  route_table_id            = aws_route_table.Prod-project-pub-route-table.id
  destination_cidr_block    = "0.0.0.0/0" 
  gateway_id                = aws_internet_gateway.Prod-project-IGW.id
}


#  Prod-project-elastic-IP-Address
resource "aws_eip" "Prod-project-VPC-IP" {
  
}


#  Prod-project-nat-gateway
resource "aws_nat_gateway" "Prod-project-Nat-gateway" {
  allocation_id = aws_eip.Prod-project-VPC-IP.id
  subnet_id     = aws_subnet.Prod-project-pub-sub-1.id

  tags = {
    Name = "Prod-project-Nat-gateway"
  }
}

#  Prod-project-Nat-gateway-association
resource "aws_route" "Prod-project-Nat-gateway" {
  gateway_id     = aws_nat_gateway.Prod-project-Nat-gateway.id
  route_table_id = aws_route_table.Prod-project-priv-route-table.id
  destination_cidr_block  ="0.0.0.0/0" 

}


