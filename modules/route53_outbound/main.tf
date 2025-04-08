resource "aws_route53_resolver_endpoint" "outbound" {
  name      = "outbound-endpoint"
  direction = "OUTBOUND"

  security_group_ids = [aws_security_group.route53_sg.id]

  ip_address {
    subnet_id = var.private_subnet_ids[0]
  }

  ip_address {
    subnet_id = var.private_subnet_ids[1]
  }
}
/*
resource "aws_route53_resolver_rule" "forward_rule" {
  name     = "forward-rule"
  rule_type = "FORWARD"
  domain_name = var.domain_name

  resolver_endpoint_id = aws_route53_resolver_endpoint.outbound.id

  target_ip {
    ip = var.ad_ip_addresses[0]
  }

  target_ip {
    ip = var.ad_ip_addresses[1]
  }
}

resource "aws_route53_resolver_rule_association" "forward_rule_association" {
  resolver_rule_id = aws_route53_resolver_rule.forward_rule.id
  vpc_id           = var.vpc_id
}
*/
resource "aws_security_group" "route53_sg" {
  name        = "route53_sg"
  description = "Security group for Route 53 Resolver"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 53
    to_port     = 53
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
