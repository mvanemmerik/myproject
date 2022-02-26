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

  placement {
    availability_zone = "us-east-1a"

  }

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name     = "MyProject"
      Platform = "amazon"
      cmby     = "Ansible"
      IaC      = "Terraform"
    }
  }

  user_data = filebase64("install_httpd.sh")

}