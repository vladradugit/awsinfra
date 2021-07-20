resource "aws_subnet" "wp_public1_subnet" {
    vpc_id = "${aws_vpc.wp_vpc.id}"
    cidr_block = "${var.cidrs["public1"]}"
    map_public_ip_on_launch = true
    availability_zone = "${data.aws_availability_zones.available.names[0]}"

tags {
    Name = "wp_public1"
 }
}

resource "aws_subnet" "wp_public2_subnet" {
    vpc_id = "${aws_vpc.wp_vpc.id}"
    cidr_block = "${var.cidrs["public2"]}"
    map_public_ip_on_launch = true
    availability_zone = "${data.aws_availability_zones.available.names[1]}"

tags {
    Name = "wp_public2"
 }
}
