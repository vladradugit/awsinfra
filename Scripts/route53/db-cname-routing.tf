#DB 
resource "aws_route53_record" "db" {
  zone_id = "${aws-route53_zone.secondary.zone_id}"
  name = "db.${var.domain_name}.com"
  type = "CNAME"
  ttl = "300"
  records = ["${aws_db_instance.wp_db_instance}"]
}