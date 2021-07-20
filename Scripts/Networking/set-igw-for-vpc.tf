#Internet Gateway

resource "aws_internet_gateway" "wp_internet_gateway"{
 vpc_id = "${aws_vpc.wp_vpc.id}"

 tags {
  Name = "wp_igw"
 }
}