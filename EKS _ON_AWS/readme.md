---

# Amazon EKS (Elastic Kubernetes Service)

## What is Amazon EKS?

Amazon **EKS (Elastic Kubernetes Service)** is a **managed Kubernetes service** provided by AWS.
It allows you to run Kubernetes clusters on AWS **without managing the Kubernetes control plane**.

EKS uses **upstream Kubernetes**, which means standard Kubernetes YAML manifests and tools (like `kubectl` and Helm) work without modification.

---

## Control Plane Managed by AWS

In Amazon EKS, the **Kubernetes control plane** is fully managed by AWS.

AWS manages:

* Kubernetes API Server
* Scheduler
* Controller Manager
* etcd
* High availability across multiple Availability Zones
* Security patches and version upgrades

👉 You **do not manage or see** the control plane nodes.

---

## Worker Nodes in EKS

EKS worker nodes can be run using:

* **Amazon EC2** (Managed or Self-managed node groups)
* **AWS Fargate** (Serverless, no node management)

---

## Ways to Create an EKS Cluster

You can create an EKS cluster using:

* **AWS Management Console (GUI)**
* **eksctl CLI** (recommended – easy and fast)

---

## Creating an EKS Cluster Using the AWS Console (GUI)

1. Go to **AWS Console → EKS**
2. Click **Create cluster**
3. If you already have a cluster elsewhere, you can choose **Register cluster**
4. Choose **Custom configuration**
5. Enter the **Cluster name**
6. Create a new **IAM role** and select it from the dropdown
7. Ensure both required roles are created and selected
8. Click **Next**
9. For **Cluster endpoint access**, choose **Public**
10. Click **Next**
11. Under **Add-ons**, select:

    * kube-proxy
    * CoreDNS
    * Amazon VPC CNI
12. Click **Next**
13. Leave defaults for remaining settings
14. Review the configuration
15. Click **Create**

⏳ Cluster creation takes approximately **5 minutes**.

---

## Deploying Applications to EKS

The AWS Console **cannot be used to deploy Kubernetes applications**.

To deploy applications, you need Kubernetes tools.

### Required Tools

* **AWS CLI**
* **eksctl**
* **kubectl**

---

## Creating an EKS Cluster Using CLI (`eksctl`)

### Command to Create Cluster

```bash
eksctl create cluster \
  --name my-cluster \
  --region us-east-1 \
  --nodegroup-name my-nodes \
  --node-type t3.medium \
  --nodes 2
```

This command automatically:

* Creates VPC and networking
* Creates the EKS control plane
* Creates a managed node group
* Configures `kubectl` access

---

### Verify Cluster Creation

```bash
kubectl get nodes
```

If nodes are listed, your cluster is ready ✅

---

## Summary

* EKS control plane is fully managed by AWS
* Worker nodes can run on EC2 or Fargate
* Cluster creation can be done via **GUI or CLI**
* Application deployment requires **kubectl / Helm / GitOps tools**
* `eksctl` is the easiest and fastest way to create EKS clusters

---

If you want, I can:

* Add **architecture diagrams**
* Add **sample app deployment YAML**
* Convert this into **Terraform**
* Add **IAM & security best practices**

Just say the word 😄
