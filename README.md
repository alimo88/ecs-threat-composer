# ECS Threat Composer Deployment

This project demonstrates a production-style container deployment on **AWS ECS Fargate** using **Docker, Terraform, and GitHub Actions CI/CD**.

The application is deployed behind an **Application Load Balancer with HTTPS**, uses **Amazon ECR for container images**, and is fully provisioned with **Infrastructure as Code (Terraform)**.

The final application is accessible through a custom domain using **Route53 and AWS Certificate Manager (ACM)**.

---

# Overview

This project focuses on the following DevOps practices:

- Containerising a web application using Docker
- Infrastructure provisioning using Terraform
- CI/CD pipelines using GitHub Actions
- Secure authentication to AWS using OIDC (no static credentials)
- HTTPS configuration using AWS Certificate Manager
- Automated deployments to AWS ECS Fargate

The goal is to demonstrate a **fully automated deployment pipeline for a containerised application on AWS**.

---

# Architecture

The infrastructure is deployed in AWS using a **highly available VPC architecture across two Availability Zones**.

The application runs on **ECS Fargate in private subnets**, while traffic is routed through an **Application Load Balancer in public subnets**.

User requests are routed through **Route53 DNS** and secured using **HTTPS with ACM certificates**.

---

# Architecture Diagram

*(architecture diagram here)*
