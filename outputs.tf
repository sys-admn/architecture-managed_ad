output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
  sensitive = true
}

output "managed_ad_id" {
  description = "The ID of the Managed AD"
  value       = module.managed_ad.managed_ad_id
  sensitive = true
}

output "bastion_public_ip" {
  description = "The public IP of the Bastion host"
  value       = module.ec2_bastion.bastion_public_ip
  sensitive = false
}
/*output "fsx_id" {
  description = "The ID of the FSx file system"
  value       = module.fsx.fsx_id
}*/
