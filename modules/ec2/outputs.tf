output "windows_server_instance_id" {
  description = "The ID of the Windows Server instance"
  value       = aws_instance.windows_server.id
}

output "windows_server_eip" {
  description = "The Elastic IP of the Windows Server instance"
  value       = aws_eip.windows_server_eip.public_ip
}
