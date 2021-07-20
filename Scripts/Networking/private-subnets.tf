resource "aws_subnet" "wp_private1_subnet" {
    vpc_id = "${aws_vpc.wp_vpc.id}"
    cidr_block = "${var.cidrs["private1"]}"
    map_public_ip_on_launch = false
    availability_zone = "${data.aws_availability_zones.available.names[0]}"

tags {
    Name = "wp_private1"
 }
}

resource "aws_subnet" "wp_private2_subnet" {
    vpc_id = "${aws_vpc.wp_vpc.id}"
    cidr_block = "${var.cidrs["private2"]}"
    map_public_ip_on_launch = false
    availability_zone = "${data.aws_availability_zones.available.names[1]}"

tags {
    Name = "wp_private2"
 }
}