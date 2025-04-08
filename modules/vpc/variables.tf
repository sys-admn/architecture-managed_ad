variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "public_subnet_count" {
  description = "The number of public subnets"
  type        = number
  default     = 2
}

variable "private_subnet_count" {
  description = "The number of private subnets"
  type        = number
  default     = 2
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"] # Remplacez par les AZ de votre région
}
