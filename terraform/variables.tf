variable "aws_region" {
  description = "AWS Region where resources will be created."
  type        = string
}

variable "instance_name" {
  description = "EC2 instance name"
  type        = string
  default     = "cloudops-ai-web-server"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}
