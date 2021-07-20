resource "aws_subnet" "wp_rds1_subnet" {
 vpc_id = "${aws_vpc.wp_vpc.id}"
 cidr_block = "${var.cidrs["rds1"]}"
 map_public_ip_on_launch = false
 availability_zone = "${data.aws_availability_zones.available.names[0]}"

 tags {
  Name = "wp_rds1"
   }
}

resource "aws_subnet" "wp_rds2_subnet" {
 vpc_id = "${aws_vpc.wp_vpc.id}"
 cidr_block = "${var.cidrs["rds2"]}"
 map_public_ip_on_launch = false
 availability_zone = "${data.aws_availability_zones.available.names[1]}"

 tags {
  Name = "wp_rds2"
 }
}

resource "aws_subnet" "wp_rds3_subnet" {
 vpc_id = "${aws_vpc.wp_vpc.id}"
 cidr_block = "${var.cidrs["rds3"]}"
 map_public_ip_on_launch = false
 availability_zone = "${data.aws_availability_zones.available.names[2]}"

 tags {
  Name = "wp_rds3"
 }
}