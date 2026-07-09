#!/bin/bash

dnf update -y

yum install -y httpd amazon-cloudwatch-agent

systemctl enable httpd
systemctl start httpd

mkdir -p /opt/aws/amazon-cloudwatch-agent/etc

cat > /opt/aws/amazon-cloudwatch-agent/etc/amazon-cloudwatch-agent.json <<EOF
{
  "metrics": {
    "append_dimensions": {
      "InstanceId": "\${aws:InstanceId}"
    },
    "metrics_collected": {
      "mem": {
        "measurement": [
          "mem_used_percent"
        ]
      },
      "disk": {
        "measurement": [
          "used_percent"
        ],
        "resources": [
          "*"
        ]
      }
    }
  },
  "logs": {
    "logs_collected": {
      "files": {
        "collect_list": [
          {
            "file_path": "/var/log/httpd/access_log",
            "log_group_name": "/cloudops-ai/apache",
            "log_stream_name": "{instance_id}"
          },
          {
            "file_path": "/var/log/httpd/error_log",
            "log_group_name": "/cloudops-ai/apache",
            "log_stream_name": "{instance_id}"
          }
        ]
      }
    }
  }
}
EOF

systemctl enable amazon-cloudwatch-agent

/opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl \
-a fetch-config \
-m ec2 \
-c file:/opt/aws/amazon-cloudwatch-agent/etc/amazon-cloudwatch-agent.json \
-s

cat <<EOF >/var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
<title>CloudOps AI Incident Response Platform</title>
</head>
<body>

<h1>CloudOps AI Incident Response Platform</h1>

<p>Provisioned using Terraform.</p>

<p>Hosted on Amazon EC2.</p>

<p>CloudWatch Agent Installed.</p>

<p>Ready for AWS DevOps Agent.</p>

</body>
</html>
EOF
