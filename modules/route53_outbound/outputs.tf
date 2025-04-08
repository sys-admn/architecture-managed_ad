output "route53_endpoint_id" {
  description = "The ID of the Route 53 Resolver endpoint"
  value       = aws_route53_resolver_endpoint.outbound.id
}

