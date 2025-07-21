output "monitoring_ip" {
  value = aws_instance.monitoring.public_ip
}
output "web_server_ip" {
  value = aws_instance.web_server.public_ip
  
}

output "monitoring_private_ip" {
  value = aws_instance.monitoring.private_ip
}

output "web_server_private_ip" {
  value = aws_instance.web_server.private_ip
}

output "loki_bucket_name" {
  value = aws_s3_bucket.loki_logs.bucket
}

output "loki_bucket_region" {
  value = var.region
}