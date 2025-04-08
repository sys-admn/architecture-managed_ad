variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
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
variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
  default     = ["eu-west-3a", "eu-west-3b"] # Remplacez par les AZ de votre région
}
/*variable "ad_ip_addresses" {
  description = "List of IP addresses for the Active Directory DNS resolvers"
  type        = list(string)
  default     = ["10.0.2.237", "10.0.3.143"] # Remplacez par les adresses IP de votre AD
}
*/