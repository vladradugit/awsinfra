#----- Auto Scailing Group-----
resource "aws_autoscaling_group" "wp_asg" {
  name                      = "asg-${aws_launch_configuration.wp_lc.id}"
  max_size                  = "${var.asg_max}"
  min_size                  = "${var.asg_min}"
  health_check_grace_period = "${var.asg_grace}"
  health_check_type         = "${var.asg_hct}"
  desired_capacity          = "${var.asg_cap}"
  force_delete              = true
  load_balacers             = ["${aws_elb.wp_elb.id}"]

  vpc_zone_indetifier = ["${aws_subnet.wp_private1_subnet.id}"
                         "${aws_subnet.wp_private2.subnet.id}" 
  ]  

  launch_configuration = "${aws_launch_configuration.wp_lc.name}"

  tag {
    key   = "Name"
    value = "wp_asg-instance"
    propagate_at_launch = true 
  }
  
  lifecycle {
    create_before_destroy = true
  }
}