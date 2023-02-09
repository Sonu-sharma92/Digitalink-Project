#Nat-gateway creation
resource "aws_eip" "nat_ip" {
  vpc = true
}


resource "aws_nat_gateway" "natgate1" {
  subnet_id = aws_subnet.Digitalsubnet1.id
  allocation_id = aws_eip.nat_ip.id

tags = {
    Name = "Nat-gate-way"
  }


# To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.


 depends_on = [aws_internet_gateway.DigitalIG]

}



resource "aws_route" "route" {
route_table_id = aws_route_table.DigitalRT2.id
destination_cidr_block = "0.0.0.0/0"
nat_gateway_id = aws_nat_gateway.natgate1.id
}
