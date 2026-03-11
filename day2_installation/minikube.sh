
sudo apt update 

sudo apt install -y curl wget apt-transport-https

sudo apt install -y docker.io
sudo systemctl enable --now docker

sudo usermod -aG docker $USER && newgrp docker

curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64

chmod +x minikube

sudo mv minikube /usr/local/bin/

curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

chmod +x kubectl
sudo mv kubectl /usr/local/bin/

minikube start --driver=docker --vm=true 

# minikube status
# kubectl get nodes

# minikube stop
# minikube delete

minikube update-context

# it will jsut show the minikube cluster 

# to set anyting default we doo 

# if getting the error use these 
 kubectl config get-contexts
# kubectl config use-context mycluster 

# kubectl get nodes