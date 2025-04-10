output "ec2_instance_ids" {
  description = "IDs of the EC2 instances"
  value       = { for k, v in aws_instance.ec2 : k => v.id }
}

output "ec2_instance_public_ips" {
  description = "Public IPs of the EC2 instances"
  value       = { for k, v in aws_instance.ec2 : k => v.public_ip }
}

output "ec2_instance_private_ips" {
  description = "Private IPs of the EC2 instances"
  value       = { for k, v in aws_instance.ec2 : k => v.private_ip }
}

output "ec2_instance_public_dns" {
  description = "Public DNS names of the EC2 instances"
  value       = { for k, v in aws_instance.ec2 : k => v.public_dns }
}
