ECS Threat Composer Deployment

This project demonstrates a production-style container deployment on AWS ECS Fargate using Docker, Terraform, and GitHub Actions CI/CD.

The application is deployed behind an Application Load Balancer with HTTPS, uses Amazon ECR for container images, and is fully provisioned with Infrastructure as Code (Terraform).

The final application is accessible through a custom domain using Route53 and ACM TLS certificates.

Overview

This project focuses on the following DevOps practices:

Containerising a web application using Docker

Infrastructure provisioning using Terraform

CI/CD pipelines using GitHub Actions

Secure authentication to AWS using OIDC (no static credentials)

HTTPS configuration using AWS Certificate Manager

Automated deployments to AWS ECS Fargate

The goal is to demonstrate a fully automated deployment pipeline for a containerised application on AWS.

Architecture

The infrastructure is deployed in AWS using a highly available VPC architecture across two Availability Zones.

The application runs on ECS Fargate in private subnets, while traffic is routed through an Application Load Balancer in public subnets.

User requests are routed through Route53 DNS and secured using HTTPS with ACM certificates.

Architecture Diagram

(Insert your Draw.io diagram here)


Repository Structure
.
├── app/                     # Application source
│
├── Dockerfile               # Container image definition
├── nginx.conf               # Nginx configuration
│
├── infra/                   # Terraform infrastructure
│   ├── backend.tf
│   ├── main.tf
│   ├── variables.tf
│   └── modules/
│       ├── vpc/
│       ├── security/
│       ├── alb/
│       ├── ecs/
│       └── ecr/
│
├── .github/workflows/       # CI/CD pipelines
│   ├── build.yaml
│   └── deploy.yaml
│
├── README.md
└── .gitignore

Containerisation

The application is packaged into a Docker container.

The container is built using a multi-stage Docker build:

Node.js builds the frontend application

Nginx serves the static build output

Example build:

docker build -t threat-composer .

Run locally:

docker run -p 8080:80 threat-composer

Verify:

curl http://localhost:8080

Image Registry (Amazon ECR)

Container images are stored in Amazon Elastic Container Registry (ECR).

The GitHub Actions pipeline automatically:

Builds the Docker image

Tags it with the Git commit SHA

Pushes it to ECR

Example image tag:

<account-id>.dkr.ecr.<region>.amazonaws.com/ecs-threat:sha
Infrastructure as Code (Terraform)

Infrastructure is provisioned using Terraform modules.

Main components deployed:

VPC

Public and Private Subnets

Internet Gateway

NAT Gateway

Security Groups

Application Load Balancer

ECS Cluster

ECS Service (Fargate)

ECR Repository

Route53 DNS Record

ACM TLS Certificate

Terraform commands used:

terraform init
terraform plan
terraform apply

To destroy infrastructure:

terraform destroy
CI/CD Automation (GitHub Actions)

Two CI/CD pipelines are implemented.

Build & Push Pipeline

Triggered on push to main when application files change.

Steps:

Checkout repository

Build Docker image

Authenticate to AWS using OIDC

Push container image to Amazon ECR

Screenshot:

(Insert GitHub Actions screenshot)

Terraform Deploy Pipeline

Triggered on push to main when infrastructure changes.

Steps:

Configure AWS credentials via OIDC

Terraform init

Terraform validate

Terraform plan

Terraform apply

Post-deployment health check

Health check:

curl https://tm.<your-domain>/health

If the endpoint is unhealthy, the pipeline fails.

Screenshot:

(Insert Terraform pipeline screenshot)

HTTPS and Domain

The application is accessible through a custom domain secured with HTTPS.

Components used:

Route53 → DNS record for subdomain

ACM → TLS certificate

ALB HTTPS listener

HTTP traffic is automatically redirected to HTTPS.

Final URL:

https://tm.<your-domain>

Example:

https://tm.example.com

Live Deployment

The deployed application can be accessed at:

https://tm.<your-domain>

Screenshot:

(Insert application running screenshot)

How to Reproduce
Requirements

AWS Account

Terraform

Docker

GitHub account

Domain configured in Route53

1. Clone Repository
git clone https://github.com/<your-repo>.git
cd ecs-threat-composer
2. Configure AWS

Ensure AWS CLI is configured.

aws sts get-caller-identity
3. Deploy Infrastructure
cd infra
terraform init
terraform apply
4. Build Container
docker build -t threat-composer .
5. Push to ECR

Authenticate Docker:

aws ecr get-login-password --region <region> \
| docker login --username AWS --password-stdin <account-id>.dkr.ecr.<region>.amazonaws.com

Push image:

docker push <repo-url>
Challenges and Lessons Learned

During this project several challenges were encountered:

Handling Terraform resource dependencies

Configuring ECS tasks inside private subnets

Setting up GitHub Actions OIDC authentication

Implementing reliable health checks in CI/CD pipelines

These challenges helped improve understanding of AWS infrastructure automation and production deployment patterns.

Future Improvements

Possible enhancements include:

Blue/Green deployments

ECS auto-scaling policies

AWS WAF integration

CloudWatch monitoring and alarms

Secrets management using AWS Secrets Manager

Technologies Used

AWS ECS Fargate

AWS ECR

AWS Route53

AWS ACM

AWS ALB

Terraform

Docker

GitHub Actions

Nginx


