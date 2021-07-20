#RDS SECURITY GROUP

resource "aws_security_group" "wp_rds_sg" {
    name = "wp_rds_sg"
    description = "Used fpr RDS instances"
    vpc_id = "${aws_vpc.wp_vpc.id}"

#SQL access from public/private security groups
    ingress {
        from_port = 3306
        to_port = 3306
        protocol = "tcp"

security_groups = ["${aws_security_group.wp_dev_sg.id}",
    "${aws_security_group.wp_public_sg.id}",
    "${aws_security_group.wp_private_sg.id}"
   ]
 }

}