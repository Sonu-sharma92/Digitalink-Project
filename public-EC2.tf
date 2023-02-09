#public server creation
resource "aws_instance" "lmsfrontend" {
  ami           = "ami-0d4360d9166cfc9cb"
  instance_type = "t2.medium"
  subnet_id     = aws_subnet.Digitalsubnet1.id
  vpc_security_group_ids = [aws_security_group.SG-SSH.id]
  availability_zone = "us-west-1a"
  associate_public_ip_address = true
  key_name = "lms"

  tags = {
    Name = "lms-frontend"
}

}
