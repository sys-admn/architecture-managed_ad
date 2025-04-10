variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}
variable "instances" {
  type = map(object({
    ami                         = string
    type                        = string
    subnet_id                   = string
    associate_public_ip_address = bool
    key_name                    = string
    eip_name                    = string
    vpc_security_group_id       = string

  }))
}