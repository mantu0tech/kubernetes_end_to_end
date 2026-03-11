
how to create a EKS cluster

in amazon EKS we need to only manage the node not the control 

go to console 

>>custom configuration 

disable eks auto mode 

name it 

attach role 

in access choose EKS API 
rest will be dafult 


create a VPC with 2 public and  private sunrts 

attach the private subnets in cluster here 
in the public subnets we are going to aattach 

kubernetes.io/role/elb add these tags in both the public subnet with 1 as value 

in the add ons 
node monitroing agents 
kube proxy 
amazon EKS pod identit agent
External DNS 
metrics server 

wait for its to cretae 

now we are going the create a managed node gropu 

you have 2 option 
manages node grp and fargate 

1st we are going to do wit the node grp 

for that create a role for nodes 

name it 
add the iam roles \
click on next 

add the 
select amazon linux 
on-demand 
t3.medium 

select your private subnet and click on create 

wait for some time and your can see the subnets 

now to conenct we need 
kubctl and aws cli in your machine 

so for that we are going to go with cloudshell

aws kubeconfig file is used to conenc tto your eks cluster 

aws eks --region us-east-1 update-kubeconfig  --name demo
kubectl get pods -A 
to get all the pods listingher 

you can see your pods runnig 

kubectl get nodes -A 

https://docs.aws.amazon.com/eks/latest/userguide/sample-deployment.html

we are going to refer these to deploy the application 

copy the file from here and run it in your application 

kubectl create namespace eks-sample-app

kubectl apply -f deplooyment.yml

we have created a deployment 
now lets access it 

to access or go inside your pods you can access it 
using the 
kubectl exec -it -n eks-sample-app eks-sample-linux-deployment-7d4648f987-k4dgx  --bin/sh

these will take you inside your pods

