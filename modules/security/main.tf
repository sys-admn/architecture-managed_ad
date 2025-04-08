resource "aws_security_group" "managed_ad_sg" {
  name        = "managed_ad_sg"
  description = "Security group for Managed AD"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 389
    to_port     = 389
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
    ingress {
    from_port   = 636
    to_port     = 636
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "fsx_sg" {
  name        = "fsx_sg"
  description = "Security group for FSx"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 445
    to_port     = 445
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "ec2_bastion_sg" {
  name        = "ec2_bastion_sg"
  description = "Security group for EC2 Bastion"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "allow_rdp" {
  name        = "ec2_sg"
  vpc_id = var.vpc_id
  description = "Security group for EC2 instance"

  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      cidr_blocks = ingress.value.cidr_blocks
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      self        = ingress.value.self
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    #cidr_blocks = ["0.0.0.0/0"] #IP Public server bastion pour limiter l'accès à internet
    cidr_blocks = ["0.0.0.0/0"]
  }
}