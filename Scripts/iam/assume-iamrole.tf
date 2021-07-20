resource "aws_iam_role" "s3_access_role"{
    name = "s3_access_role"

    assume_role_policy = <<EOF
{
    "Version":"2012-10-17",
    "Statement": [
{
    "Action": "sts:AssumeRole",
    "Principal": {
    "Service": "ec2.amazonaws.com"
},
    "Effect": "Allow",
    "Sid": ""
   }
  ]
}
EOF
}
