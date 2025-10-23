provider "aws" {
  region = "ap-south-1"
}

resource "aws_security_group" "web_sg" {
  name_prefix = "jenkins-web-sg-"
  description = "Allow web traffic"
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "web_server" {
  ami           = "ami-0f58b397bc5c1f2e8"
  instance_type = "t2.micro"
  user_data = <<-EOF
              #!/bin/bash
              yum install docker -y
              service docker start
              docker run -d -p 80:80 Parvez1604/node-ci-app
              EOF

  vpc_security_group_ids = [aws_security_group.web_sg.id]
  tags = {
    Name = "Jenkins-Terraform-Web"
  }
}

output "public_ip" {
  value = aws_instance.web_server.public_ip
}
