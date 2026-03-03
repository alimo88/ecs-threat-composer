output "target_group_arn" {
  value       = aws_alb_target_group.app.arn
  description = "ARN of the target group for ECS to register tasks into."
}

output "listener_https_arn" {
  value       = aws_alb_listener.https.arn
  description = "ARN of the HTTPS listener."
}

output "alb_dns_name" {
  value       = aws_alb.main.dns_name
  description = "Public DNS name of the ALB."
}

output "alb_zone_id" {
  value       = aws_alb.main.zone_id
  description = "Route53 hosted zone ID for alias record to this ALB."
}