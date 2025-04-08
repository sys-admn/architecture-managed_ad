output "bastion_public_ip" {
  description = "The public IP of the Bastion host"
  value       = aws_instance.bastion.public_ip
}
