#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
dockerpath="leok13/duytt10-clouddevopsengin-project4"

# Step 2
# Run the Docker Hub container with kubernetes
kubectl run duytt10-clouddevopsengin-project4 --image=$dockerpath --port=80 --labels app=duytt10-clouddevopsengin-project4

# Step 3:
# List kubernetes pods
echo "kubectl get pods"
kubectl get pods

while :; do
    if [[ $(kubectl get pods -o jsonpath='{.items[0].status.phase}') != "Running" ]]; then
        echo "Waiting for pod running"
        sleep 5
    else
        echo "Pod running"
        break
    fi
done
# Step 4:
# Forward the container port to a host
kubectl port-forward duytt10-clouddevopsengin-project4 8000:80
