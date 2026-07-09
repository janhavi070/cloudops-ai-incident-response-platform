output "instance_public_ip" {
  value = aws_instance.web.public_ip
}

output "instance_public_dns" {
  value = aws_instance.web.public_dns
}

output "cloudwatch_log_group" {
  value = aws_cloudwatch_log_group.apache_logs.name
}
