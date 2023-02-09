#VPC creation

resource "aws_vpc" "VPCDigitalink" {
  cidr_block = "10.0.0.0/16"

tags = {
    Name = "VPC-Digitalink"
  }

}



#subnet1

resource "aws_subnet" "Digitalsubnet1" {
  vpc_id     = aws_vpc.VPCDigitalink.id
  availability_zone = "us-west-1a"
  cidr_block = "10.0.0.0/24"

tags = {
    Name = "Digital-subnet1"
  }
}


#subnet2

resource "aws_subnet" "Digitalsubnet2" {
  vpc_id     = aws_vpc.VPCDigitalink.id
  availability_zone = "us-west-1b"
  cidr_block = "10.0.1.0/24"

tags = {
    Name = "Digital-subnet2"
  }

}

#subnet3

resource "aws_subnet" "Digitalsubnet3" {
  vpc_id     = aws_vpc.VPCDigitalink.id
  availability_zone = "us-west-1b"
  cidr_block = "10.0.2.0/24"

tags = {
    Name = "Digital-subnet3"
  }
}


#Internetgateway

resource "aws_internet_gateway" "DigitalIG" {
  vpc_id = aws_vpc.VPCDigitalink.id

tags = {
    Name = "Digital-IG"
  }
}


#Routetable-1

resource "aws_route_table" "DigitalRT1" {
  vpc_id = aws_vpc.VPCDigitalink.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.DigitalIG.id
  }

tags = {
    Name = "Digital-RT1"
  }
}

#Routetable-2

resource "aws_route_table" "DigitalRT2" {
  vpc_id = aws_vpc.VPCDigitalink.id

tags = {
    Name = "Digital-RT2"
  }
}




#Routetable 3

resource "aws_route_table" "DigitalRT3" {
  vpc_id = aws_vpc.VPCDigitalink.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.DigitalIG.id
  }

tags = {
    Name = "Digital-RT3"
  }
}

#subnetAssociation-1

resource "aws_route_table_association" "DigitalRT1ass" {
  subnet_id      = aws_subnet.Digitalsubnet1.id
  route_table_id = aws_route_table.DigitalRT1.id
}

#subnetAssociation-2

resource "aws_route_table_association" "DigitalRT2ass" {
  subnet_id      = aws_subnet.Digitalsubnet2.id
  route_table_id = aws_route_table.DigitalRT2.id

}

#subnetAssociation-3

resource "aws_route_table_association" "DigitalRT3ass" {
  subnet_id      = aws_subnet.Digitalsubnet3.id
  route_table_id = aws_route_table.DigitalRT3.id
}



output "vpc_id" {

value = "${aws_vpc.VPCDigitalink.id}"

}

