resource "aws_autoscaling_group" "myproject" {
  name             = "myproject-amazon"
  min_size         = 0
  max_size         = 1
  desired_capacity = 0
  # launch_configuration = aws_launch_configuration.myproject.name
  launch_template {
    id      = aws_launch_template.myproject.id
    version = "$Latest"
  }

  vpc_zone_identifier = ["subnet-0de79979472359bc7", "subnet-076193e2726917564"]

  lifecycle {
    ignore_changes = [desired_capacity, target_group_arns, tags]
  }

  tag {
    key                 = "Name"
    value               = "MyProject-amazon"
    propagate_at_launch = true
  }
  tag {
    key                 = "Platform"
    value               = "amazon"
    propagate_at_launch = true
  }
  tag {
    key                 = "cmby"
    value               = "Ansible"
    propagate_at_launch = true
  }

}

resource "aws_autoscaling_schedule" "myproject_day" {
  scheduled_action_name = "day"
  min_size              = 0
  max_size              = 1
  desired_capacity      = 0
  start_time            = "2022-03-13T14:00:00Z"
  recurrence            = "00 12 * * *"

  autoscaling_group_name = aws_autoscaling_group.myproject.name
}

resource "aws_autoscaling_schedule" "myproject_night" {
  scheduled_action_name  = "night"
  min_size               = 0
  max_size               = 1
  desired_capacity       = 0
  start_time             = "2022-03-13T20:00:00Z"
  recurrence             = "00 23 * * *"
  autoscaling_group_name = aws_autoscaling_group.myproject.name
}

resource "aws_autoscaling_group" "myproject-ubuntu" {
  name             = "myproject-ubuntu"
  min_size         = 0
  max_size         = 1
  desired_capacity = 0
  # launch_configuration = aws_launch_configuration.myproject-ubuntu.name
  launch_template {
    id      = aws_launch_template.myproject-ubuntu.id
    version = "$Latest"
  }

  vpc_zone_identifier = ["subnet-0de79979472359bc7", "subnet-076193e2726917564"]

  lifecycle {
    ignore_changes = [desired_capacity, target_group_arns, tags]
  }

  tag {
    key                 = "Name"
    value               = "MyProject-ubuntu"
    propagate_at_launch = true
  }
  tag {
    key                 = "Platform"
    value               = "ubuntu"
    propagate_at_launch = true
  }
  tag {
    key                 = "cmby"
    value               = "Ansible"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_schedule" "myproject-ubuntu_day" {
  scheduled_action_name = "day"
  min_size              = 0
  max_size              = 1
  desired_capacity      = 0
  start_time            = "2022-03-13T16:00:00Z"
  recurrence            = "00 14 * * *"

  autoscaling_group_name = aws_autoscaling_group.myproject-ubuntu.name
}

resource "aws_autoscaling_schedule" "myproject-ubuntu_night" {
  scheduled_action_name  = "night"
  min_size               = 0
  max_size               = 1
  desired_capacity       = 0
  start_time             = "2022-03-13T20:00:00Z"
  recurrence             = "00 22 * * *"
  autoscaling_group_name = aws_autoscaling_group.myproject-ubuntu.name
}