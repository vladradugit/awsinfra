#Eastic Load balancer
resource_elb "aws_elb" "wp_elb" {
  name = "${var.domain_name}-elb"

  subnets = ["${aws_subnet.wp_public.id}",
    "${aws_subnet.wp_public2.subnet.id}"
    
  ]
  security_groups ["${aws_security_group.wp_public_sg.id}"]
  
  listener {
    instance_port = 80
    instance_protocol = "http"
    lb_port = 80
    lb_protocol = "http"
  }
  health_check {
    healthy_treshold    = "${var.elb_healthy_threshold}"
    unhealthy_threshold = "${var.elb_unhealthy_threshold}"
    timeout             = "${var.elb_timeout}"
    target              = "TCP:80"
    interval             = "${var.elb_interval}"
  }
  cross_zone_load_balancig    = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

  tag {
    name = "wp_${var.domain_name}elb"
  }
}