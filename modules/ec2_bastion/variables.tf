variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "public_subnet_id" {
  description = "The ID of the public subnet"
  type        = string
}

variable "ami_id" {
  description = "The AMI ID for the bastion host"
  type        = string
  default     = "ami-05f08ad7b78afd8cd" # Replace with a valid AMI ID
}

variable "instance_type" {
  description = "The instance type for the bastion host"
  type        = string
  default     = "t2.micro"
}
variable "vpc_security_group_ids" {
  description = "The security group ID to associate with the bastion host"
  type        = string
}
variable "key_name" {
  description = "The key pair name to use for the bastion host"
  type        = string
  default     = "secure-bastion"
}