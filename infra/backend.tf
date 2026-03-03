terraform {
  backend "s3" {
    bucket         = "ecs-threat-s3"
    key            = "threatcomp/terraform.tfstate"
    region         = "eu-west-2"
    dynamodb_table = "ecs-threat-dynamo"
    encrypt        = true
  }
}