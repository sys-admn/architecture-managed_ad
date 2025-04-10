module "vpc" {
  source             = "./modules/vpc"
  vpc_cidr_block     = var.vpc_cidr_block
  availability_zones = var.availability_zones
}
# Appel du module pour le groupe de sécurité Managed AD
module "managed_ad_sg" {
  source = "./modules/security"

  name        = "managed_ad_sg"
  description = "Security group for Managed AD"
  vpc_id      = module.vpc.vpc_id

  ingress_rules = [
    {
      cidr_blocks = ["0.0.0.0/0"]
      from_port   = var.ldap_port
      to_port     = var.ldap_port
      protocol    = "tcp"
    },
    {
      cidr_blocks = ["0.0.0.0/0"]
      from_port   = var.ldaps_port
      to_port     = var.ldaps_port
      protocol    = "tcp"
    }
  ]
}

# Appel du module pour le groupe de sécurité FSx
module "fsx_sg" {
  source = "./modules/security"

  name        = "fsx_sg"
  description = "Security group for FSx"
  vpc_id      = module.vpc.vpc_id

  ingress_rules = [
    {
      cidr_blocks = ["0.0.0.0/0"]
      from_port   = var.smb_port
      to_port     = var.smb_port
      protocol    = "tcp"
    }
  ]
}

module "route53_sg" {
  source = "./modules/security"

  name        = "route53_sg"
  description = "Security group for FSx"
  vpc_id      = module.vpc.vpc_id

  ingress_rules = [
    {
      cidr_blocks = ["0.0.0.0/0"]
      from_port   = var.dns_port
      to_port     = var.dns_port
      protocol    = "udp"
    }
  ]
}
# Appel du module pour le groupe de sécurité EC2 Bastion
module "ec2_bastion_sg" {
  source = "./modules/security"

  name        = "ec2_bastion_sg"
  description = "Security group for EC2 Bastion"
  vpc_id      = module.vpc.vpc_id

  ingress_rules = [
    {
      cidr_blocks = ["0.0.0.0/0"]
      from_port   = var.rdp_port
      to_port     = var.rdp_port
      protocol    = "tcp"
    }
  ]
}

# Appel du module pour le groupe de sécurité permettant RDP
module "allow_rdp" {
  source = "./modules/security"

  name        = "allow_rdp_sg"
  description = "Security group for allowing RDP"
  vpc_id      = module.vpc.vpc_id

  ingress_rules = var.ingress_rules
}


module "managed_ad" {
  source             = "./modules/managed_ad"
  vpc_id             = module.vpc.vpc_id
  domain_name        = var.domain_name
  admin_password     = var.admin_password
  private_subnet_ids = module.vpc.private_subnet_ids

}

module "fsx" {
  source            = "./modules/fsx"
  vpc_id            = module.vpc.vpc_id
  managed_ad_id     = module.managed_ad.managed_ad_id
  private_subnet_id = module.vpc.private_subnet_ids[0]
  security_group_id = module.fsx_sg.security_group_id
}

module "ec2" {
  source = "./modules/ec2"
  vpc_id = module.vpc.vpc_id

  instances = {
    "windows-server" = {
      ami                         = var.instances["windows-server"].ami
      type                        = var.instances["windows-server"].type
      subnet_id                   = module.vpc.private_subnet_ids[1]
      associate_public_ip_address = var.instances["windows-server"].associate_public_ip_address
      key_name                    = var.instances["windows-server"].key_name
      eip_name                    = var.instances["windows-server"].eip_name
      vpc_security_group_id       = module.allow_rdp.security_group_id
        tags = {
    Environment = "Stage"
    Service ="Ec2Instance"
  }
    }
    "bastion" = {
      ami                         = var.instances["bastion"].ami
      type                        = var.instances["bastion"].type
      subnet_id                   = module.vpc.public_subnet_ids[0]
      associate_public_ip_address = var.instances["bastion"].associate_public_ip_address
      key_name                    = var.instances["bastion"].key_name
      eip_name                    = var.instances["bastion"].eip_name
      vpc_security_group_id       = module.ec2_bastion_sg.security_group_id
        tags = {
    Environment = "Stage"
    Service ="Ec2Instance"
  }
    }
  }
}

module "route53_outbound" {
  source             = "./modules/route53_outbound"
  vpc_id             = module.vpc.vpc_id
  private_subnet_ids = module.vpc.private_subnet_ids
  domain_name        = var.domain_name
  security_group_id  = module.route53_sg.security_group_id
  #ad_ip_addresses = var.ad_ip_addresses


}
