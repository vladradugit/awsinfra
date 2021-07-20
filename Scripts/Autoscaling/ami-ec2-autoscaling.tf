#Ami-for-autoscailing-group

#random ami id

resource "random_id" "golden_ami" {
  byte_length = 3
}

#Ami

resource "aws_ami_from_instance" "wp_golden" {
  name               = "wp_ami_${random_id.golden_ami.b64}"
  source_instance_id = "${aws_instance.wp_dev.id}"
  
  provisioner "local-exec" {
    command = <<EOT
cat <<EOF > userdata
#!/bin/bash
/usr/bin/aws s3 sync s3://${aws_s3_bucket.code.bucket} /var/www/html/
/bin/touch /var/spool/cron/root
sudo /bin/echo '*/5 * * * * aws s3 sync s3://${aws_s3_bucket.code.bucket} /var/www/html' >> /var/spool/corn/root
EOF
EOD
  }

}