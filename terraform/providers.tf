provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Project     = "CloudOps AI Incident Response Platform"
      ManagedBy   = "Terraform"
      Environment = "Learning"
      Owner       = "Janhavi"
    }
  }
}
