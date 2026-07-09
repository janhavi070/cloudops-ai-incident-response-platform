#!/bin/bash

dnf update -y

dnf install -y httpd

systemctl enable httpd
systemctl start httpd

cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
<title>CloudOps AI Incident Response Platform</title>
</head>

<body>

<h1>CloudOps AI Incident Response Platform</h1>

<p>Provisioned using Terraform.</p>

<p>Hosted on Amazon EC2.</p>

<p>Ready for CloudWatch and AWS DevOps Agent.</p>

</body>
</html>

EOF
