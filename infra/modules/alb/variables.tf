variable "vpc_id" {
  type        = string
  description = "VPC ID where the ALB + target group will be created."
}

variable "public_subnet_ids" {
  type        = list(string)
  description = "Public subnet IDs where the ALB will be attached."
}

variable "alb_sg_id" {
  type        = string
  description = "Security group ID for the ALB."
}

variable "app_port" {
  type        = number
  description = "Application port the ALB forwards to (target group port)."
}

variable "health_check_path" {
  type        = string
  description = "HTTP path used by the target group health check."
}

variable "certificate_arn" {
  type        = string
  description = "ACM certificate ARN for the HTTPS listener."
}