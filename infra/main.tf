terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws",
        version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "monitoring-logging-server" {
    ami = "ami-0f58b397bc5c1f2e8"
    instance_type = "t2.small"
    key_name = "aws-key-pair"
    vpc_security_group_ids = [aws_security_group.monitoring-logging-security-group.id]
    associate_public_ip_address = true

    tags = {
        Name = "monitoring logging server"
    }
}

resource "aws_security_group" "monitoring-logging-security-group" {
    name = "security-group-monitoring-logging"
    
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
  
}


