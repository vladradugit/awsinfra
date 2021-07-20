#DEV - Public Zone
 resource "aws_route52_record" "dev" {
   zone_id = "${aws_route53_zone.primary.zone_id}"
   name = "dev.${var.domain_name}.com"
   type = "A"
   ttl = "300"
   records = ["${aws_instance.wp_dev.public_ip}"]
 }