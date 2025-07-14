provider "aws" {
  region = "us-east-1"
}

resource "aws_key_pair" "my_key" {
  key_name   = "monitoring-key"
  public_key = file("~/.ssh/monitoring-key.pub")
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
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 9090
    to_port     = 9090
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 9100
    to_port     = 9100
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
  from_port   = 9093
  to_port     = 9093
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}
  ingress {
  from_port   = 3100
  to_port     = 3100
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}



  tags = {
    Name = "monitoring-sg"
  }
}

resource "aws_instance" "monitoring" {
  ami           = "ami-0a7d80731ae1b2435" # Ubuntu 22.04
  instance_type = "t2.micro"
  key_name      = aws_key_pair.my_key.key_name
  security_groups = [aws_security_group.monitoring_sg.name]

  tags = {
    Name = "Monitoring-Node"
  }

}
