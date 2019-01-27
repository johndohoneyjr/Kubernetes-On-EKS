
# VPC Variables
variable "cluster-name" {}
variable "aws-region" {}
variable "vpc-subnet-cidr" {}

# K8 Variables
variable "k8s-version" {}
variable "node-instance-type" {}
variable "desired-capacity" {}
variable "max-size" {}
variable "min-size" {}
