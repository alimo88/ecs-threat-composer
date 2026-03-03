output "ecs_cluster_id" {
  value       = aws_ecs_cluster.cluster.id
  description = "ID of the ECS cluster."
}

output "ecs_service_name" {
  value       = aws_ecs_service.service.name
  description = "Name of the ECS service."
}

output "ecs_task_definition_arn" {
  value       = aws_ecs_task_definition.app_task.arn
  description = "ARN of the ECS task definition."
}