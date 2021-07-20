#PUBLIC SECURITY GROUP

resource "aws_security_group" "wp_public_sg" {
    name = "wp_public_sg"
    description = "Used for the elastic load balancer for public access"
    vpc_id = "${aws_vpc.wp_vpc.id}"

#HTTP

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
}
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
 }
}