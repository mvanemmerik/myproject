resource "aws_launch_template" "myproject" {
  name                                 = "myproject"
  image_id                             = data.aws_ami.amazon-linux.id
  instance_initiated_shutdown_behavior = "terminate"
  instance_type                        = "t2.micro"
  key_name                             = "ansible"

  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [aws_security_group.myproject_instance.id]
  }

  lifecycle {
    create_before_destroy = false
    ignore_changes        = [tags]
  }

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name     = "MyProject-amazon"
      Platform = "amazon"
      cmby     = "Ansible"
    }
  }

  user_data = filebase64("amazon.sh")

}

resource "aws_launch_template" "myproject-ubuntu" {
  name                                 = "myproject-ubuntu"
  image_id                             = data.aws_ami.ubuntu.id
  instance_initiated_shutdown_behavior = "terminate"
  instance_type                        = "t2.micro"
  key_name                             = "ansible"

  lifecycle {
    create_before_destroy = false
    ignore_changes        = [tags]
  }


  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [aws_security_group.myproject_instance.id]
  }


  tag_specifications {
    resource_type = "instance"

    tags = {
      Name     = "MyProject-ubuntu"
      Platform = "ubuntu"
      cmby     = "Ansible"
    }
  }

  user_data = filebase64("ubuntu.sh")

}

