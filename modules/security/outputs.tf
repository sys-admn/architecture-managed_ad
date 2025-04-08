
output "ec2_bastion_sg_id" {
  description = "The ID of the ec2_bastion_sg security group"
  value       = aws_security_group.ec2_bastion_sg.id
}

output "fsx_sg_id" {
  description = "The ID of the fsx_sg security group"
  value       = aws_security_group.fsx_sg.id
}

output "allow_rdp_id" {
  description = "The ID of the allow_rdp security group"
  value       = aws_security_group.allow_rdp.id
}