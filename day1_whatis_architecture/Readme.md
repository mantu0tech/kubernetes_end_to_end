# Kubernetes – History, Purpose, and Architecture

## History of Kubernetes

Kubernetes was originally **developed by Google** based on its internal experience running containers at massive scale.  
Google had been using container-based workloads for over a decade through internal systems like **Borg**.

In **2014**, Google **open-sourced Kubernetes**, allowing the broader community to use and contribute to it.  
In **2015**, Kubernetes was donated to the **Cloud Native Computing Foundation (CNCF)**, where it is now maintained as a vendor-neutral project.

Kubernetes is **inspired by Borg**, Google’s internal cluster management system that handled scheduling, scaling, and managing containers across thousands of machines.

---

## Why Kubernetes?

Kubernetes exists to solve the problem of running containers reliably at scale.

### Container Orchestration
Kubernetes orchestrates containers across multiple machines by deciding:
- Where containers should run
- How many copies should run
- How containers communicate with each other

It replaces manual container management with automated, policy-driven control.

### Auto-Healing
Kubernetes continuously monitors application health and:
- Restarts failed containers
- Replaces crashed Pods
- Reschedules Pods from failed nodes to healthy ones

The system always works to match the **desired state**.

### Auto-Scaling
Kubernetes can automatically scale applications:
- Up when load increases
- Down when load decreases

Scaling is based on CPU, memory, or custom metrics.

### Load Balancing
Kubernetes automatically distributes traffic across multiple Pods using Services, ensuring:
- High availability
- Even traffic distribution
- No single point of failure

### Rolling Updates
Kubernetes supports zero-downtime updates by:
- Gradually replacing old containers with new ones
- Ensuring a minimum number of Pods are always running
- Allowing rollback if an update fails

---

## Docker vs Kubernetes

### Docker
- Builds container images
- Runs containers
- Best suited for single-host environments

### Kubernetes
- Manages containers across many machines
- Handles scaling, failures, networking, and updates
- Designed for production-scale workloads

**Docker runs containers.  
Kubernetes manages containers at scale.**

---

## Kubernetes Architecture Components

Kubernetes follows a **Control Plane + Worker Node** architecture.

---

## Control Plane

The Control Plane is responsible for managing the entire Kubernetes cluster.  
It makes global decisions and maintains the desired state.

### API Server
- Central management component
- Exposes the Kubernetes REST API
- All communication goes through the API Server
- Validates requests and updates cluster state

The API Server is the **front door** of Kubernetes.

---

### Scheduler
- Assigns Pods to Worker Nodes
- Selects nodes based on:
  - Resource availability (CPU, memory)
  - Constraints and policies
- Does not run containers itself

The Scheduler only decides **where** Pods should run.

---

### Controller Manager
- Runs multiple controllers
- Each controller watches cluster state and takes action to fix mismatches

Examples:
- Ensures the correct number of Pods are running
- Detects node failures
- Recreates missing resources

Controllers continuously reconcile **desired state vs actual state**.

---

### etcd
- Distributed key-value datastore
- Stores the entire cluster state
- Acts as the single source of truth
- Highly consistent and fault-tolerant

All configuration and state data lives in etcd.

---

## Worker Node

Worker Nodes run application workloads.

---

### kubelet
- Agent running on every Worker Node
- Communicates with the API Server
- Ensures containers defined in Pods are running
- Reports node and Pod status

kubelet directly manages container lifecycle on the node.

---

### kube-proxy
- Handles networking on the node
- Maintains network rules
- Enables Service-based load balancing
- Routes traffic to correct Pods

kube-proxy ensures Pods are reachable.

---

### Container Runtime

The container runtime is responsible for:
- Pulling container images
- Creating containers
- Starting and stopping containers

Kubernetes does not run containers directly; it relies on the container runtime to do so.

Examples of container runtimes:
- containerd
- CRI-O
- Docker (historically)

The runtime executes containers on behalf of Kubernetes.

---

## Architecture Summary

- **Control Plane** manages the cluster
- **Worker Nodes** run applications
- **API Server** is the communication hub
- **Scheduler** decides Pod placement
- **Controller Manager** maintains desired state
- **etcd** stores cluster data
- **kubelet** runs Pods
- **kube-proxy** manages networking
- **Container Runtime** runs containers

---

## End of README
