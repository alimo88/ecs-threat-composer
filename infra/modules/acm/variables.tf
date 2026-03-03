variable "domain_name" {
  type        = string
  description = "Full domain name for the app (e.g. tm.ali-m.org)."
}

variable "hosted_zone_name" {
  type        = string
  description = "Route53 hosted zone name (e.g. ali-m.org)."
}

variable "alb_dns_name" {
  type        = string
  description = "ALB DNS name for alias record."
}

variable "alb_zone_id" {
  type        = string
  description = "ALB hosted zone id for alias record."
}