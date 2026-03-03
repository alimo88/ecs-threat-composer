module "vpc" {
  source   = "./modules/vpc"
  vpc_cidr = var.vpc_cidr
  az_count = var.az_count
}

module "sg" {
  source   = "./modules/sg"
  vpc_id   = module.vpc.vpc_id
  app_port = 80
}

module "ecr" {
  source          = "./modules/ecr"
  repository_name = "threat-composer-image"
}

module "alb" {
  source = "./modules/alb"

  vpc_id            = module.vpc.vpc_id
  public_subnet_ids = module.vpc.public_subnet_ids
  alb_sg_id         = module.sg.alb_sg_id

  app_port          = 80
  health_check_path = "/"
  certificate_arn   = module.acm.certificate_arn
}

module "ecs" {
  source = "./modules/ecs"
  

  container_image = "${module.ecr.repository_url}:${var.image_tag}"
  container_port        = 80
  service_desired_count = 2
  task_cpu              = 256
  task_memory           = 512

  private_subnet_ids    = module.vpc.private_subnet_ids
  ecs_security_group_id = module.sg.ecs_tasks_sg_id

  alb_target_group_arn = module.alb.target_group_arn
  alb_listener_arn     = module.alb.listener_https_arn
}

module "acm" {
  source           = "./modules/acm"
  domain_name      = var.domain_name # e.g. "tm.ali-m.org"
  hosted_zone_name = "ali-m.org"

  alb_dns_name = module.alb.alb_dns_name
  alb_zone_id  = module.alb.alb_zone_id
}