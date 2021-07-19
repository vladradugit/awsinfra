#VPC ENDPOIT FOR S3
resource "aws_vpc_endpoint" "wp_private-s3_endpoint" {
    vpc_id = "${aws_vpc.wp_vpc.id}"
    service_name = "com.amazonaws.${var.aws_region}.s3"

route_table_ids = ["${aws_vpc.wp_vpc.main_route_table_id}",
    "${aws_route_table.wp_public_rt.id}"
 ]

  policy = <<POLICY
{
   "Statement": [
       {
           "Action": "*",
           "Effect": "Allow",
           "Resource": "*",
           "Principal": "*"
       }
   ]

}
POLICY
}