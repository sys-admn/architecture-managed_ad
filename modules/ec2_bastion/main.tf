resource "aws_instance" "bastion" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.public_subnet_id
  associate_public_ip_address = true
  vpc_security_group_ids = [var.vpc_security_group_ids]
  key_name = var.key_name

  tags = {
    Name = "BastionHost"
  }
}
resource "aws_eip" "bastion_eip" {
  domain   = "vpc"
  instance = aws_instance.bastion.id

  tags = {
    Name = "Bastion-EIP"
  }
}

