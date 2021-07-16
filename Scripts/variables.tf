<<<<<<< HEAD
variable "aws_region" {}
variable "aws_profile" {}
data "aws_availability_zones" "available" {}
variable "vpc_cidr" {}
variable "cidrs" {
 type = "map"
}
variable "localip"{}
variable "domain_name"{}
variable "db_instance_class"{}
variable "dbname"{}
variable "dbuser"{}
=======
variable "aws_region" {}
variable "aws_profile" {}
data "aws_availability_zones" "available" {}
variable "vpc_cidr" {}
variable "cidrs" {
 type = "map"
}
variable "localip"{}
variable "domain_name"{}
variable "db_instance_class"{}
variable "dbname"{}
variable "dbuser"{}
>>>>>>> 2292cf6e2933bda362869ca9cecab946a24d0185
variable "dbpassword"{}