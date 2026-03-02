# Kubernetes Pods, Deployments, and Services

## What is a Pod?

A **Pod** is the **smallest deployable unit** in Kubernetes.

A Pod:
- Runs one or more containers
- Shares the same network namespace
- Shares storage volumes
- Is scheduled on a single node

Containers inside a Pod:
- Share the same IP address
- Communicate using `localhost`
- Start and stop together

Pods are **ephemeral** and can be created or destroyed at any time.

---

## Multi-Container Pods

A **multi-container Pod** contains more than one container working together.

Reasons to use multi-container Pods:
- Helper containers
- Sidecar containers
- Log collectors
- Proxy containers

Characteristics:
- All containers share the same IP
- Containers share volumes
- Containers are tightly coupled
- Containers scale together

If containers must always run together, they belong in the same Pod.

---

## ReplicaSets

A **ReplicaSet** ensures that a **specified number of identical Pods** are running at all times.

Responsibilities:
- Maintains desired number of Pods
- Creates new Pods if some fail
- Deletes extra Pods if too many exist

ReplicaSets use **labels and selectors** to manage Pods.

ReplicaSets are rarely managed directly by users.

---

## Deployments

A **Deployment** provides **declarative management** of Pods and ReplicaSets.

A Deployment:
- Creates and manages ReplicaSets
- Manages Pod lifecycle
- Supports rolling updates and rollbacks

Deployments are the **recommended way** to run applications in Kubernetes.

---

## Deployment Rolling Updates

Rolling updates allow you to:
- Update application versions without downtime
- Gradually replace old Pods with new Pods

How it works:
- A new ReplicaSet is created
- Pods are updated in small batches
- Old Pods are terminated gradually
- Traffic continues to flow during the update

Rolling updates ensure application availability.

---

## Rollbacks

Rollbacks allow you to:
- Revert to a previous application version
- Recover quickly from failed deployments

Kubernetes keeps a history of ReplicaSets.
If a deployment fails, Kubernetes can restore the previous state.

Rollbacks are fast and safe.

---

## Why Service?

Pods are **not reliable endpoints** because:
- Pods can be deleted
- Pods can be recreated
- Pod IP addresses change

A **Service** provides a **stable network identity** for Pods.

Services:
- Abstract Pod IP changes
- Enable load balancing
- Allow service discovery

---

## Pod IP Changes

Pod IPs change because:
- Pods are ephemeral
- Pods are recreated during scaling or updates
- Nodes may fail

Without Services, applications would break whenever Pod IPs change.

Services solve this problem.

---

## Load Balancing

Services perform **load balancing** by:
- Distributing traffic across multiple Pods
- Ensuring high availability
- Preventing traffic overload on a single Pod

Traffic is evenly spread using label selectors.

---

## Service Types

Kubernetes provides different Service types based on access requirements.

---

## ClusterIP

**ClusterIP** is the default Service type.

Characteristics:
- Accessible only inside the cluster
- Provides internal load balancing
- Used for internal communication

ClusterIP is ideal for backend services.

---

## NodePort

**NodePort** exposes the Service on a static port on each node.

Characteristics:
- Accessible using `<NodeIP>:<NodePort>`
- Exposes the service externally
- Port range is typically 30000–32767

NodePort is useful for development and testing.

---

## LoadBalancer

**LoadBalancer** exposes the Service using an external load balancer.

Characteristics:
- Automatically provisions a cloud load balancer
- Provides a public IP
- Routes traffic to Pods

LoadBalancer is commonly used in cloud environments.

---

## Summary

- Pod is the smallest Kubernetes unit
- Multi-container Pods run tightly coupled containers
- ReplicaSets maintain Pod count
- Deployments manage ReplicaSets
- Rolling updates provide zero-downtime deployments
- Rollbacks restore previous versions
- Services provide stable networking
- Pod IPs change, Services do not
- Services perform load balancing
- ClusterIP, NodePort, and LoadBalancer are Service types

---

## End of README
