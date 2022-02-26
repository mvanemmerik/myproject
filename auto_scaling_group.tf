resource "aws_autoscaling_group" "myproject" {
  name             = "myproject"
  min_size         = 0
  max_size         = 1
  desired_capacity = 1
  launch_template {
    id      = aws_launch_template.myproject.id
    version = "$Latest"
  }
  vpc_zone_identifier = ["subnet-0de79979472359bc7", "subnet-076193e2726917564"]

  tag {
    key                 = "Name"
    value               = "MyProject-amazon"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_schedule" "myproject_day" {
  scheduled_action_name = "day"
  min_size              = 0
  max_size              = 1
  desired_capacity      = 1
  start_time            = "2022-02-27T12:00:00Z"
  recurrence            = "00 12 * * *"

  autoscaling_group_name = aws_autoscaling_group.myproject.name
}

resource "aws_autoscaling_schedule" "myproject_night" {
  scheduled_action_name  = "night"
  min_size               = 0
  max_size               = 1
  desired_capacity       = 0
  start_time             = "2022-02-27T02:00:00Z"
  recurrence             = "00 02 * * *"
  autoscaling_group_name = aws_autoscaling_group.myproject.name
}

resource "aws_autoscaling_group" "myproject-ubuntu" {
  name             = "myproject-ubuntu"
  min_size         = 0
  max_size         = 1
  desired_capacity = 1
  launch_template {
    id      = aws_launch_template.myproject-ubuntu.id
    version = "$Latest"
  }
  vpc_zone_identifier = ["subnet-0de79979472359bc7", "subnet-076193e2726917564"]

  tag {
    key                 = "Name"
    value               = "MyProject-ubuntu"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_schedule" "myproject-ubuntu_day" {
  scheduled_action_name = "day"
  min_size              = 0
  max_size              = 1
  desired_capacity      = 1
  start_time            = "2022-02-27T12:00:00Z"
  recurrence            = "00 12 * * *"

  autoscaling_group_name = aws_autoscaling_group.myproject-ubuntu.name
}

resource "aws_autoscaling_schedule" "myproject-ubuntu_night" {
  scheduled_action_name  = "night"
  min_size               = 0
  max_size               = 1
  desired_capacity       = 0
  start_time             = "2022-02-27T02:00:00Z"
  recurrence             = "00 02 * * *"
  autoscaling_group_name = aws_autoscaling_group.myproject-ubuntu.name
}