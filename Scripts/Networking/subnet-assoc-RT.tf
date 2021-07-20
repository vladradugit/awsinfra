# Subnet Associations

resource "aws_route_table_association" "wp_public1_assoc"   {
    subnet_id = "${aws_subnet.wp_public1_subnet.id}"
    route_table_id = "${aws_route_table.wp_public_rt.id}"
}

resource "aws_route_table_association" "wp_public2_assoc"   {
    subnet_id = "${aws_subnet.wp_public2_subnet.id}"
    route_table_id = "${aws_route_table.wp_public_rt.id}"
}

resource "aws_route_table_association" "wp_pirvate1_assoc"  {
    subnet_id =  "${aws_subnet.wp_private1_subnet.id}"
    route_table_id = "${aws_default_route_table.wp_private_rt.id}"
}

resource "aws_route_table_association" "wp_private2_assoc"  {
    subnet_id = "${aws_subnet.wp_private2_subnet.id}"
    route_table_id = "${aws_default_route_table.wp_private_rt.id}"
}