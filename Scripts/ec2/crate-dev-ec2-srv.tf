#Creating Dev Server

resource "aws_key_pair" "wp_auth" {
    key_name = "${var.key_name}"
    public_key = "${file(var.public_key_path)}"
}

resource "aws_instance" "wp_dev" {
    instance_type = "${var.dev_instance_type}"
    ami = "${var.dev_ami}"

tags {
    Name = "wp_dev"
    }

key_name = "${aws_key_pair.wp_auth.id}"
vpc_security_group_ids = ["${aws_security_group.wp_dev_sg.id}"]
iam_instance_profile = "${aws_iam_instance_profile.s3_access_profile.id}"
subnet_id = "${aws_subnet.wp_public1_subnet.id}"

provisioner "local-exec" {
    command = <<EOD
    cat <<EOF > aws_hosts
[dev]
${aws_instance.wp_dev.public_ip}
[dev:vars]  
s3code=${aws_s3_bucket.code.bucket}
domain=${var.domain_name}
EOF
EOD }

   provisioner "local-exec" {
        command = "aws ec2 wait instance-status-ok --instance-ids ${aws_instance.wp_dev.id} --profile awsinfra && ansible-playbook -i aws hosts wordpress.yml"
 }
}