#!/usr/bin/env bash

if kubectl config get-clusters | grep -q myCluster; then
    echo
    echo "Cluster 'infra' already exists!"
    echo
else
    echo
    echo "Creating cluster..."
    eksctl create cluster --config-file=./infrastructure/infra.yml --timeout=60m 
    # --profile=eks
    # aws eks create-cluster --region us-est-1 --name myCluster --kubernetes-version 1.27 \
    #     --role-arn arn:aws:iam::802320067565:role/myEKSClusterRole \
    #     --resources-vpc-config subnetIds=subnet-093c1dd6761d81b05,subnet-0434161e599cbe89a,securityGroupIds=sg-024155ed01e4f4042
fi