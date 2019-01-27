# Kubernetes-On-EK

Deploy a full AWS EKS cluster with Terraform to configure a Kubernetes Cluster

## Resources created:

AWS VPC with:
 Internet Gateway (IGW)
 Public and Private Subnets
 Security Groups, Route Tables and Route Table Associations
 IAM roles, instance profiles and policies

EKS Cluster
 Autoscaling group (ASG) and Launch Configuration
 Worker Nodes in private Subnet

Scripts
 KUBECONFIG declaration
 Terrraform Output that builds ConfigMap required to register worker nodes with EKS
 Handy commands for managing AWS EKS

## Configuration

Configuration variables are found in variable.tf.  Optionally, create a terraform.tfvars in the project root, to place your variable default overrides.

## Terraform Module Usage

```bash
module "module" {
  source             = "./eks"
# VPC Config
  vpc-subnet-cidr    = "${var.vpc-subnet-cidr}"
  aws-region         = "${var.aws-region}"
# K8 Config
  k8s-version        = "${var.k8s-version}"
  cluster-name       = "${var.cluster-name}"
# ASG Config
  desired-capacity   = "${var.desired-capacity}"
  max-size           = "${var.max-size}"
  min-size           = "${var.min-size}"
# AMI Config
  node-instance-type = "${var.node-instance-type}"
}
```

### IAM

The AWS credentials must be associated with a user having at least the following AWS managed IAM policies

* IAMFullAccess
* AutoScalingFullAccess
* AmazonEKSClusterPolicy
* AmazonEKSWorkerNodePolicy
* AmazonVPCFullAccess
* AmazonEKSServicePolicy
* AmazonEKS_CNI_Policy
* AmazonEC2FullAccess

In addition, you will need to create the following managed policies

*EKS*

```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "eks:*"
            ],
            "Resource": "*"
        }
    ]
}
```

### Terraform

You need to run the following commands to create the resources with Terraform:

```bash
terraform init
terraform plan
terraform apply
```

### Setup kubectl to manage your cluster

Setup your `KUBECONFIG`

```bash
./scripts/setUpKubeconfig.sh
```

### Remove the cluster and VPC


```bash
terraform destroy 
```
