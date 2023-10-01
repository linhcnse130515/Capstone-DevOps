#!/usr/bin/env bash
# This file deploy k8s

## Assuming the Kubernetes cluster is ready
echo "GET NODES..."
kubectl get nodes

## Deploy an App from the Dockerhub to the Kubernetes Cluster
kubectl apply -f k8s/app_green_deployment.yml
kubectl apply -f k8s/app_green_service.yml

## See the status
echo "GET PODS..."
kubectl get pods

## See services
echo "GET SERVICES..."
kubectl get services