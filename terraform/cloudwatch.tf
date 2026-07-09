resource "aws_cloudwatch_log_group" "apache_logs" {
  name              = "/cloudops-ai/apache"
  retention_in_days = 7
}

resource "aws_cloudwatch_metric_alarm" "high_cpu" {
  alarm_name          = "cloudops-ai-high-cpu"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2

  metric_name = "CPUUtilization"

  namespace = "AWS/EC2"

  period = 120

  statistic = "Average"

  threshold = 70

  alarm_description = "CPU exceeds 70%"

  dimensions = {
    InstanceId = aws_instance.web.id
  }
}
