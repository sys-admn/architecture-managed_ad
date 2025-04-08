module "vpc" {
  source             = "./modules/vpc"
  vpc_cidr_block     = var.vpc_cidr_block
  availability_zones = var.availability_zones
}
module "security" {
  source = "./modules/security"
  vpc_id = module.vpc.vpc_id
}

module "managed_ad" {
  source         = "./modules/managed_ad"
  vpc_id         = module.vpc.vpc_id
  domain_name    = var.domain_name
  admin_password = var.admin_password
  private_subnet_ids = module.vpc.private_subnet_ids

}

module "fsx" {
  source            = "./modules/fsx"
  vpc_id            = module.vpc.vpc_id
  managed_ad_id     = module.managed_ad.managed_ad_id
  private_subnet_id = module.vpc.private_subnet_ids[0]
  security_group_id = module.security.fsx_sg_id
}

module "ec2_bastion" {
  source           = "./modules/ec2_bastion"
  vpc_id           = module.vpc.vpc_id
  public_subnet_id = module.vpc.public_subnet_ids[0]
  vpc_security_group_ids = module.security.ec2_bastion_sg_id
}
module "ec2" {
  source = "./modules/ec2"
  vpc_id           = module.vpc.vpc_id
  private_subnet_id = module.vpc.private_subnet_ids[1]
  vpc_security_group_ids  = module.security.allow_rdp_id
}

module "route53_outbound" {
  source             = "./modules/route53_outbound"
  vpc_id             = module.vpc.vpc_id
  private_subnet_ids = module.vpc.private_subnet_ids
  domain_name = var.domain_name
  #ad_ip_addresses = var.ad_ip_addresses
  

}
