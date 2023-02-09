#Private server creation
resource "aws_instance" "lmsBackend" {
  ami           = "ami-0d4360d9166cfc9cb"
  count = 2
  instance_type = "t2.medium"
  availability_zone = "us-west-1b"
  subnet_id     = aws_subnet.Digitalsubnet2.id
  vpc_security_group_ids = [aws_security_group.SG-SSH.id]
   associate_public_ip_address = true
  key_name = "lms"

tags = {
  Name = "lmsbackend-${count.index+1}"
}

}
