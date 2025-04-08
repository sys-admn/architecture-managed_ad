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
