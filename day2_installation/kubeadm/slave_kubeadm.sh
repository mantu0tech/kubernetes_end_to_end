#!/bin/bash

# Execute on ALL of your Worker Nodes

# 1. Perform pre-flight checks and reset the node:
sudo kubeadm reset  pre-flight checkes 
# type yes 

# 2. Paste the join command you got from the master node and append --v=5 at the end:
# Example:
# sudo kubeadm join <control-plane-ip>:6443 --token <token> \
# --discovery-token-ca-cert-hash sha256:<hash> \
# --cri-socket "unix:///run/containerd/containerd.sock" --v=5

# npow go to your master and types kubectl get nodes and you can see 
# your post 
# watch kubectl get pods 
# kubectl run nginx --image=nginx:latest 