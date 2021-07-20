#Private zone
resource "aws_route53_zone" "secondary" {
  name = "${var.domain_name}.com"
  vpc_id = "${aws_vpc.wp_vpc.id}"
}