resource "aws_launch_configuration" "myproject" {
  name_prefix     = "myproject-aws-asg-"
  image_id        = data.aws_ami.amazon-linux.id
  instance_type   = "t2.micro"
  user_data       = filebase64("amazon.sh")
  key_name        = "ansible"
  security_groups = [aws_security_group.myproject_instance.id]

  lifecycle {
    create_before_destroy = true
  }

}

resource "aws_launch_configuration" "myproject-ubuntu" {
  name_prefix     = "myproject-ubuntu-aws-asg-"
  image_id        = data.aws_ami.ubuntu.id
  instance_type   = "t2.micro"
  user_data       = filebase64("ubuntu.sh")
  key_name        = "ansible"
  security_groups = [aws_security_group.myproject_instance.id]

  lifecycle {
    create_before_destroy = true
  }

}