#!/usr/bin/env bash

if kubectl config get-clusters | grep -q myCluster; then
    echo
    echo "Cluster 'infra' already exists!"
    echo
else
    echo
    echo "Creating cluster..."
    # eksctl create cluster --config-file=./infrastructure/infra.yml --timeout=60m --profile=eks
    aws eks create-cluster --region us-est-1 --name myCluster --kubernetes-version 1.27 \
        --role-arn arn:aws:iam::263031845436:user/linhcn3:role/eksClusterRole \
        --resources-vpc-config subnetIds=eks-cluster-sg-myCluster-775609682,eks-cluster-sg-myCluster-775609682,securityGroupIds=eks-cluster-sg-myCluster-775609682
fi