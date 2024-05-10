output "ip-address-ec2" {
  value = aws_instance.monitoring-logging-server.public_ip
}