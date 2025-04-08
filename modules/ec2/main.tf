resource "aws_instance" "windows_server" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.private_subnet_id
  associate_public_ip_address = true
  vpc_security_group_ids = [var.vpc_security_group_ids]
  key_name = var.key_name

  tags = {
    Name = "Windows Server"
  }
}

resource "aws_eip" "windows_server_eip" {
  instance = aws_instance.windows_server.id

  tags = {
    Name = "Windows-Server-EIP"
  }
}