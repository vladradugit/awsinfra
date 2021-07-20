#-------------ROUTE 53----------

#Primary zone

resource "aws_route53_zone" "primary" {
  name              = "${var.domain_name}.com"
  delegation_sed_id = "${var_delegation_set}"
}

 #WWW record inside route 53

 resource "aws_route53_record" "www" {
   zone_id = "${aws_route53_zone.primary.zone_id}"
   name = "www.${var.domain_name}.com"
   type = "A"

   alias {
    name                  = "${aws_elb.wp_elb.dns_name}"
    zone_id               = "${aws_elb.wp_elb.zone_id}"
    evaluate_targe_health = false 
  }
 }