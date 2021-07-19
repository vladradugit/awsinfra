#----IAM-----

#S3_access

resource "aws_iam_instance_profile" "s3_access_profile" {
    name = "S3_access"
    role = "${aws_iam_role.s3_access_role.name}"
}

resource "aws_iam_role_policy" "s3_access_policy" {
    name = "s3_access_policy"
    role = "${aws_iam_role.s3_access_role.id}"

    policy = <<EOF
{
    "Verion":"2012-10-17",
    "Statement": [
    {
        "Effect": "Allow",
        "Action": "s3:*",
        "Resource":"*"
        }
    }
  ]
}
EOF
}