#SECURITY GROUPS

resource "aws_security_group" "wp_dev_sg" {
    name = "wp_dev_sg"
    description = "Used for access the dev instance"
    vpc_id = "${aws_vpc.wp_vpc.id}"

#SSH

    ingress    {
        from_port = 22
        to_port    = 22
        protocol   = "tcp"
    cidr_blocks= ["${var.localip}"]
}

#HTTP

    ingress {
        from_port = 80
        to_port = 80
        protocol  = "tcp"
        cidr_blocks = ["${var.localip}"]

 }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
 }
}
