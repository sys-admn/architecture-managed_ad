resource "aws_fsx_windows_file_system" "main" {
  storage_capacity    = 300
  subnet_ids          = [var.private_subnet_id]
  deployment_type     = "SINGLE_AZ_1"
  throughput_capacity = 512
  active_directory_id = var.managed_ad_id
  security_group_ids = [var.security_group_id]

}
