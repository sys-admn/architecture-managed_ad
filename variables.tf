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

  sensitive = true
}
variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"] # Remplacez par les AZ de votre région
}
/*variable "ad_ip_addresses" {
  description = "List of IP addresses for the Active Directory DNS resolvers"
  type        = list(string)
  default     = ["10.0.2.237", "10.0.3.143"] # Remplacez par les adresses IP de votre AD
}
*/
variable "instances" {
  default = {
    "windows-server" = {
      ami                         = "ami-0c765d44cf1f25d26"
      type                        = "t2.micro"
      associate_public_ip_address = true
      key_name                    = "secure"
      eip_name                    = "Windows-Server-EIP"
    }
    "bastion" = {
      ami                         = "ami-05f08ad7b78afd8cd"
      type                        = "t2.nano"
      associate_public_ip_address = true
      key_name                    = "secure-bastion"
      eip_name                    = "Bastion-EIP"
    }
  }
}

variable "ldap_port" {
  description = "The LDAP port"
  type        = number
  default     = 389
}

variable "ldaps_port" {
  description = "The LDAPS port"
  type        = number
  default     = 636
}

variable "smb_port" {
  description = "The SMB port"
  type        = number
  default     = 445
}

variable "rdp_port" {
  description = "The RDP port"
  type        = number
  default     = 3389
}

variable "dns_port" {
  description = "The LDAP port"
  type        = number
  default     = 53
}
variable "ingress_rules" {
  description = "List of ingress rules for the security group"
  type = list(object({
    cidr_blocks = list(string)
    from_port   = number
    to_port     = number
    protocol    = string
    self        = optional(bool, false)
  }))
  default = [
    {
      cidr_blocks = ["10.0.0.0/16"]
      from_port   = -1
      to_port     = -1
      protocol    = "icmp"
    },
    {
      cidr_blocks = ["10.0.0.0/16"]
      from_port   = 111
      to_port     = 111
      protocol    = "tcp"
    },
    {
      cidr_blocks = ["10.0.0.0/16"]
      from_port   = 20048
      to_port     = 20048
      protocol    = "tcp"
    },
    {
      cidr_blocks = ["10.0.0.0/16"]
      from_port   = 2049
      to_port     = 2049
      protocol    = "tcp"
    },
    {
      cidr_blocks = ["10.0.0.0/16"]
      from_port   = 445
      to_port     = 445
      protocol    = "tcp"
    },
    {
      cidr_blocks = ["10.0.0.0/16"]
      from_port   = 53
      to_port     = 53
      protocol    = "tcp"
    },
    {
      cidr_blocks = ["10.0.0.0/16"]
      from_port   = 53
      to_port     = 53
      protocol    = "udp"
    },
    {
      cidr_blocks = ["10.0.0.0/16"]
      from_port   = 5985
      to_port     = 5985
      protocol    = "tcp"
    },
    {
      cidr_blocks = ["0.0.0.0/0"]
      from_port   = 3389
      to_port     = 3389
      protocol    = "tcp"
      self        = false
    },
  ]
}
