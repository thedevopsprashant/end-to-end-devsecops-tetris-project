data "aws_ami" "ami" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
 
  owners = ["099720109477"] #universal aws managed No need to change
}

resource "aws_instance" "ec2" {
  ami                    = data.aws_ami.ami.image_id
  instance_type          = "t3a.2xlarge"
  key_name               = var.key-name
  subnet_id              = module.vpc.public_subnets[0]
  vpc_security_group_ids = [aws_security_group.security-group.id]
  iam_instance_profile   = aws_iam_instance_profile.instance-profile.name

  root_block_device {
    volume_size = 30
  }

  user_data = templatefile("./tools-install.sh", {})

  tags = {
    Name = var.instance-name
  }
}