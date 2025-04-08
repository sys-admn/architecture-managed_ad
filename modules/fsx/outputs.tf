output "fsx_id" {
  description = "The ID of the FSx file system"
  value       = aws_fsx_windows_file_system.main.id
}
