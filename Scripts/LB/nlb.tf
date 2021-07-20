module "nlb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 6.0"

  name = "${var.domain_name}"-NLB

  load_balancer_type = "network"

  vpc_id  = "${var.vpc_id.wp_vpc.id"
  subnets = ["${aws_subnet.wp_public1.id}" , "${aws_subnet.wp_public2.id}"]

  access_logs = {
    bucket = "my-nlb-logs"
  }

  target_groups = [
    {
      name_prefix      = "pref-"
      backend_protocol = "TCP"
      backend_port     = 80
      target_type      = "ip"
    }
  ]

  https_listeners = [
    {
      port               = 443
      protocol           = "TLS"
      certificate_arn    = "arn:aws:iam::123456789012:server-certificate/test_cert-123456789012"
      target_group_index = 0
    }
  ]

  http_tcp_listeners = [
    {
      port               = 80
      protocol           = "TCP"
      target_group_index = 0
    }
  ]

  tags = {
    Environment = "Test"
  }
}