variable "vpc_cidr" {
  type    = string
  default = "172.17.0.0/16"
}

variable "az_count" {
  type    = number
  default = 2
}

variable "aws_region" {
  type    = string
  default = "eu-west-2"
}

variable "image_tag" {
  type    = string
  default = "9f086d5"
}

variable "domain_name" {
  type    = string
  default = "tm.ali-m.org"
}
