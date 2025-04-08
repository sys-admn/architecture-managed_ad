variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs"
  type        = list(string)
}

variable "domain_name" {
  description = "The domain name for the Managed AD"
  type        = string
}
/*
variable "ad_ip_addresses" {
  description = "List of IP addresses for the Active Directory DNS resolvers"
  type        = list(string)
}*/