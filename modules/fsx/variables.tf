variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "managed_ad_id" {
  description = "The ID of the Managed AD"
  type        = string
}

variable "private_subnet_id" {
  description = "The ID of the private subnet"
  type        = string
}
variable "security_group_id" {
  description = "The security group ID to associate with the fsx"
  type        = string
}

