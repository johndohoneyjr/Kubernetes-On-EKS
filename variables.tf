# Variables Configuration

variable "cluster-name" {
  default     = "dohoney-eks-cluster"
  type        = "string"
  description = "Name of your EKS Cluster"
}

variable "aws-region" {
  default     = "us-west-2"
  type        = "string"
  description = "AWS Region to deploy EKS"
}

variable "k8s-version" {
  default     = "1.11"
  type        = "string"
  description = "Kubernetes version"
}

variable "vpc-subnet-cidr" {
  default     = "10.0.0.0/16"
  type        = "string"
  description = "VPC Subnet CIDR"
}

variable "node-instance-type" {
  default     = "m5.large"
  type        = "string"
  description = "Worker Node EC2 instance type"
}

##
## Autoscaling variable parameters
##

variable "desired-capacity" {
  default     = 3
  type        = "string"
  description = "Autoscaling Desired node capacity"
}

variable "max-size" {
  default     = 5
  type        = "string"
  description = "AS maximum node capacity"
}

variable "min-size" {
  default     = 3
  type        = "string"
  description = "AS Minimum node capacity"
}
