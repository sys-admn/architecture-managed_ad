resource "aws_directory_service_directory" "main" {
  name     = var.domain_name
  password = var.admin_password
  edition    = "Standard"
  type       = "MicrosoftAD"
  vpc_settings {
    vpc_id     = var.vpc_id
    subnet_ids = var.private_subnet_ids
  }
}
