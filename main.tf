# Main file to create resources

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

resource "aws_key_pair" "oseg_MyKeys" {
  key_name = "work_keys"
  public_key = file("/home/luiz/.ssh/work_keys.pub")
}

resource "aws_instance" "oseg_InstanceTest" {
  ami           = "ami-0cf0e376c672104d6"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.oseg_Subnet.id
  key_name = aws_key_pair.oseg_MyKeys.key_name
  security_groups = [aws_security_group.sg.id]

  root_block_device{
    volume_size = "10"
    volume_type = "gp3"
  }

  tags = {
    Name = "Instance-test-VPC"
  }

  user_data = file("config_apache.sh")
}
