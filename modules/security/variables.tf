variable "name" {
  description = "The name of the security group"
  type        = string
}

variable "description" {
  description = "The description of the security group"
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
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
}
