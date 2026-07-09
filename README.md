# CloudOps AI Incident Response Platform

A beginner-friendly project that demonstrates how to build, monitor, and investigate an application running on AWS using **Terraform**, **CloudWatch**, and **AWS DevOps Agent**.

The goal of this project was not just to deploy an EC2 instance, but to understand the complete workflow of provisioning infrastructure, collecting monitoring data, simulating an incident, and using AI to investigate the problem.

---

## Project Overview

In this project I:

- Provisioned AWS infrastructure using Terraform
- Deployed an Apache web server on an EC2 instance
- Configured CloudWatch Agent for metrics and log collection
- Connected the project to AWS DevOps Agent
- Simulated a real production incident
- Used AI to investigate the incident and generate a runbook

---

## Architecture

```
Terraform
     │
     ▼
AWS EC2 + Apache
     │
     ▼
CloudWatch Agent
     │
     ▼
CloudWatch Logs & Metrics
     │
     ▼
AWS DevOps Agent
     │
     ▼
AI Incident Investigation
```

---

## Technologies Used

- Terraform
- AWS EC2
- IAM Roles
- Security Groups
- Apache HTTP Server
- CloudWatch
- CloudWatch Agent
- AWS DevOps Agent
- Git & GitHub

---

## Project Structure

```
cloudops-ai-incident-response-platform/
.
├── keys
│   ├── cloudops-ai-key
│   └── cloudops-ai-key.pub
├── LICENSE
├── README.md
└── terraform
    ├── cloudwatch.tf
    ├── ec2.tf
    ├── iam.tf
    ├── keypair.tf
    ├── outputs.tf
    ├── providers.tf
    ├── security_groups.tf
    ├── terraform.tfstate
    ├── terraform.tfstate.backup
    ├── terraform.tfvars
    ├── tfplan
    ├── userdata.sh
    ├── variables.tf
    └── versions.tf

```

---

## How It Works

### Step 1

Terraform creates the AWS infrastructure.

This includes:

- EC2 Instance
- IAM Role
- Security Group
- CloudWatch resources

---

### Step 2

When the EC2 instance starts, it automatically:

- Installs Apache
- Installs CloudWatch Agent
- Starts the web server
- Sends logs and metrics to CloudWatch

---

### Step 3

CloudWatch collects:

- CPU metrics
- Memory metrics
- Disk usage
- Apache logs

---

### Step 4

AWS DevOps Agent uses this information to investigate incidents and suggest possible root causes.

---

## Incident Simulation

To test the monitoring setup, I intentionally stopped the Apache service.

```
sudo systemctl stop httpd
```

The website became unavailable.

AWS DevOps Agent investigated the incident using the available CloudWatch data and identified the Apache service as the likely root cause.

After restarting Apache,

```
sudo systemctl start httpd
```

the application became healthy again.

---

## What I Learned

This project helped me understand:

- Why Infrastructure as Code is useful
- How Terraform manages AWS resources
- Why IAM Roles are better than storing AWS credentials
- How CloudWatch collects logs and metrics
- How AWS DevOps Agent helps investigate incidents
- How to debug EC2 user data and CloudWatch Agent issues

---

## Future Improvements

Some improvements I would like to make in the future:

- Application Load Balancer
- Auto Scaling Group
- SNS notifications
- CloudWatch Dashboard
- CI/CD pipeline using GitHub Actions
- More automated incident remediation

---

## Cleanup

After completing the project, all AWS resources were removed using:

```bash
terraform destroy
```

This helps avoid unnecessary AWS charges.

---

## Connect With Me

If you have any suggestions or feedback, feel free to connect with me on LinkedIn or open an issue in this repository.

Thanks for visiting!
