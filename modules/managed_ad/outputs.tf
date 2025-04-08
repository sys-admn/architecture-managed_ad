output "managed_ad_id" {
  description = "The ID of the Managed AD"
  value       = aws_directory_service_directory.main.id
}
