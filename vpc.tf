# Create VPC into AWS

resource "aws_vpc" "oseg_Vpc_1" {               
  cidr_block = var.vpc_CIDR
  instance_tenancy = var.instance_tenancy    
  tags = {
    Name = "Oseg - VPC 1"
  }
}

resource "aws_subnet" "oseg_Subnet" {
  vpc_id =  aws_vpc.oseg_Vpc_1.id
  cidr_block = var.public_CIDR 
  map_public_ip_on_launch = true
  tags = {
    Name = "Oseg - Subrede 1"
  }   
}

resource "aws_internet_gateway" "oseg_Gateway" {  
  vpc_id = aws_vpc.oseg_Vpc_1.id
  tags = {
    Name = "Oseg - Gateway 1"
  }             
 }

resource "aws_route_table" "oseg_PublicRoute" {
  vpc_id = aws_vpc.oseg_Vpc_1.id
}

resource "aws_route_table_association" "oseg_PubRouteAssociation" {
  subnet_id = aws_subnet.oseg_Subnet.id
  route_table_id = aws_route_table.oseg_PublicRoute.id
}
