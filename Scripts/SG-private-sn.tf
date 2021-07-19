#PRIVATE SECURITY GROUP
resource "aws_security_group" "wp_private_sg" {
    name = "wp_private_sg"
    description = "Used for private instaces"
    vpc_id = "${aws_vpc.wp_vpc.id}"

#Access from VPC
    ingress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["${var.vpc_cidr}"]
}
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
 }
}