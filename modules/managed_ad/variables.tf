variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "domain_name" {
  description = "The domain name for the Managed AD"
  type        = string
}

variable "admin_password" {
  description = "The admin password for the Managed AD"
  type        = string
  sensitive   = true
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs"
  type        = list(string)
}