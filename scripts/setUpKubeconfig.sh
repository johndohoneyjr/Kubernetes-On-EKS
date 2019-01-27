#! /bin/bash

unset KUBECONFIG

terraform output kubeconfig > ~/.kube/eks-cluster
export KUBECONFIG=~/.kube/eks-cluster

echo
echo $KUBECONFIG
echo

echo
echo "Authorize worker node, get config map from Terraform"
echo
terraform output config-map > configMap-aws.yaml
kubectl apply -f configMap-aws.yaml
rm `pwd`/configMap-aws.yaml

echo
echo "Check that Worker Nodes are adding to the cluster, this can take 1-2 mins"
echo
kubectl get nodes --watch


