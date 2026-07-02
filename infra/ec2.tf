resource "aws_key_pair" "my_key" {
  key_name   = "${var.env}-my-key"
  public_key = file("my-key.pub")

  tags = {
    Environment = var.env
  }
}

resource "aws_default_vpc" "my_vpc" {
  
}

data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
}

resource "aws_security_group" "my_sg" {
  name   = "${var.env}-sg"

  ingress {
    from_port   = 22
    to_port     = 22
    description = "SSH"
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

resource "aws_instance" "my_instance" { 
    count = var.instance_count
    ami             = data.aws_ami.ubuntu.id
    instance_type   = var.instance_type
    security_groups = [aws_security_group.my_sg.name]
    key_name        = aws_key_pair.my_key.key_name
    root_block_device {
      volume_size = 9
      volume_type = "gp3"
    }

    tags = {
        name = "${var.env}-instance_ec2"
        Environment = var.env
    }
}