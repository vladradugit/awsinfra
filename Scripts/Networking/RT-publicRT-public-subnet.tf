# Route Tables
# Public Route Table in Public subnet
resource "aws_route_table" "wp_public_rt" {
vpc_id = "${aws_vpc.wp_vpc.id}"

route {
   cidr_block = "0.0.0.0/0"
   gateway_id = "${aws_internet_gateway.wp_internet_gateway.id}"
 }

tags {
   Name = "wp_public"
 }
}

resource "aws_default_route_table" "wp_private_rt" {
default_route_table_id = "${aws_vpc.wp_vpc.default_route_table_id}"

tags  {
   Name = "wp_public"
 }
}