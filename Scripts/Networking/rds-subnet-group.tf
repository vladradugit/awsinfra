#RDS SUBNET GROUP

resource "aws_db_subnet_group" "wp_rds_subnetgroup" {
    name = "wp_rds_subnetgroup"

    subnet_ids = [ "${aws_subnet.wp_rds1_subnet.id}",
    "${aws_subnet.wp_rds2_subnet.id}",
    "${aws_subnet.wp_rds3_subnet.id}"
]

    tags {
        Name = "wp_rds_sng"
 }
}