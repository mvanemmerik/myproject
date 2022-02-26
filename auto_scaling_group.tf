resource "aws_autoscaling_group" "myproject" {
  name             = "myproject"
  min_size         = 0
  max_size         = 2
  desired_capacity = 1
  launch_template {
    id      = aws_launch_template.myproject.id
    version = "$Latest"
  }
  vpc_zone_identifier = ["subnet-0de79979472359bc7", "subnet-076193e2726917564"]

  tag {
    key                 = "Name"
    value               = "My Project"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_schedule" "myproject_day" {
  scheduled_action_name = "day"
  min_size              = 0
  max_size              = 2
  desired_capacity      = 1
  start_time            = "2022-02-27T11:00:00Z"
  recurrence            = "00 11 * * *"

  autoscaling_group_name = aws_autoscaling_group.myproject.name
}

resource "aws_autoscaling_schedule" "myproject_night" {
  scheduled_action_name  = "night"
  min_size               = 0
  max_size               = 2
  desired_capacity       = 0
  start_time             = "2022-02-27T03:00:00Z"
  recurrence             = "00 03 * * *"
  autoscaling_group_name = aws_autoscaling_group.myproject.name
}