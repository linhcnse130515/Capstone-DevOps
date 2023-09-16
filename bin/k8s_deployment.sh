#!/usr/bin/env bash
# This file deploy k8s

# Step 1:
# Create eks
./bin/eks_create_cluster.sh

## Assuming the Kubernetes cluster is ready
echo "GET NODES..."
kubectl get nodes

## Deploy an App from the Dockerhub to the Kubernetes Cluster
kubectl apply -f k8s/app_deployment.yml
kubectl apply -f k8s/app_service.yml

## See the status
echo "GET PODS..."
kubectl get pods

## See services
echo "GET SERVICES..."
kubectl get services