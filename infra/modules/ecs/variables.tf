variable "container_image" {
  type        = string
  description = "Docker image used by the ECS task."
}

variable "container_port" {
  type        = number
  description = "Port exposed by the container."
}

variable "service_desired_count" {
  type        = number
  default     = 1
  description = "Number of ECS tasks to run."
}

variable "task_cpu" {
  type        = number
  description = "Fargate CPU units."
}

variable "task_memory" {
  type        = number
  description = "Fargate memory in MB."
}

variable "private_subnet_ids" {
  type        = list(string)
  description = "Private subnets where ECS tasks will run."
}

variable "ecs_security_group_id" {
  type        = string
  description = "Security group attached to ECS tasks."
}

variable "alb_target_group_arn" {
  type        = string
  description = "ALB target group ARN."
}

variable "alb_listener_arn" {
  type        = string
  description = "ALB HTTPS listener ARN."
}