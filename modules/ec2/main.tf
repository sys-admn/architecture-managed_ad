resource "aws_instance" "ec2" {
  for_each = var.instances

  ami                         = each.value.ami
  instance_type               = each.value.type
  subnet_id                   = each.value.subnet_id
  associate_public_ip_address = each.value.associate_public_ip_address
  vpc_security_group_ids      = [each.value.vpc_security_group_id]
  key_name                    = each.value.key_name

  tags = {
    Name = each.key
    Service ="Ec2Instance"
    Environment = "Stage"
  }
}

resource "aws_eip" "eip" {
  for_each = var.instances

  instance = aws_instance.ec2[each.key].id
  domain   = each.key == "bastion" ? "vpc" : null

  tags = {
    Name = each.value.eip_name
    Service = "EIPService"
    Environment = "Stage"
  }
}