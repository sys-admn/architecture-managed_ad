output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
  sensitive   = true
}

output "managed_ad_id" {
  description = "The ID of the Managed AD"
  value       = module.managed_ad.managed_ad_id
  sensitive   = true
}
/*
output "bastion_public_ip" {
  description = "The public IP of the Bastion host"
  value       = module.ec2_bastion.bastion_public_ip
  sensitive = false
}*/

/*output "fsx_id" {
  description = "The ID of the FSx file system"
  value       = module.fsx.fsx_id
}*/
output "ec2_instance_ids" {
  value = module.ec2.ec2_instance_ids
}

output "ec2_instance_public_ips" {
  value = module.ec2.ec2_instance_public_ips
}

output "ec2_instance_private_ips" {
  value = module.ec2.ec2_instance_private_ips
}

output "ec2_instance_public_dns" {
  value = module.ec2.ec2_instance_public_dns
}

# Outputs pour les IDs des groupes de sécurité
output "ec2_bastion_sg_id" {
  value = module.ec2_bastion_sg.security_group_id
}

output "fsx_sg_id" {
  value = module.fsx_sg.security_group_id
}

output "allow_rdp_id" {
  value = module.allow_rdp.security_group_id
}
output "managed_ad_sg_id" {
  value = module.managed_ad_sg.security_group_id
}