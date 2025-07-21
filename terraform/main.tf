provider "aws" {
  region = "us-east-1"
}

resource "aws_key_pair" "my_key" {
  key_name   = var.key_name
  public_key = file(var.public_key_path)
}


resource "aws_security_group" "monitoring_sg" {
  name        = "monitoring-security-group"
  description = "Security group for monitoring instance"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "monitoring-sg"
  }
}

resource "aws_instance" "monitoring" {
  ami           = var.ami # Ubuntu 22.04
  instance_type = var.instance_type
  key_name      = aws_key_pair.my_key.key_name
  security_groups = [aws_security_group.monitoring_sg.name]

  tags = {
    Name = "Monitoring-Node"
  }

}
resource "aws_instance" "web_server" {
  ami                         = var.ami
  instance_type               = var.instance_type
  key_name                    = var.key_name
  security_groups             = [aws_security_group.main.name]
  associate_public_ip_address = true

  tags = {
    Name = "Web_Server"
  }
}

resource "aws_security_group" "main" {
  name        = "web_server_sg"
  description = "Security group for web server"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    security_groups = [aws_security_group.monitoring_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress  {
    from_port   = 9100
    to_port     = 9100
    protocol    = "tcp"
    security_groups = [aws_security_group.monitoring_sg.id]
  }
  tags = {
    Name = "web_server_sg"
  }

}

resource "aws_s3_bucket" "loki_logs" {
  bucket = "loki-logs-for-monitoring"
  force_destroy = true
}


data "template_file" "inventory" {
  template = file("inventory.tpl")
  vars = {
    monitoring_server_ip = aws_instance.monitoring.public_ip
    web_server_ip        = aws_instance.web_server.public_ip
    monitoring_private_ip = aws_instance.monitoring.private_ip
    web_server_private_ip = aws_instance.web_server.private_ip
  }
}

resource "local_file" "inventory" {
  content  = data.template_file.inventory.rendered
  filename = "../ansible/inventory.ini"
}