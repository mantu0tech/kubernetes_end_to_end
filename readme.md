Great 👍 Since you're teaching students, it's useful to give them **common `kubectl` commands they will actually use in real environments** with Kubernetes. I'll keep **one-line explanations** so it's easy to teach.

---

# Important Kubernetes Commands for Students

## 1️⃣ Cluster Information

`kubectl cluster-info`
→ Displays information about the Kubernetes cluster control plane and services.

`kubectl version`
→ Shows the client and server version of Kubernetes.

`kubectl config get-contexts`
→ Lists all Kubernetes cluster contexts configured on the system.

`kubectl config use-context <context-name>`
→ Switches to a different Kubernetes cluster context.

---

# 2️⃣ Node Commands

`kubectl get nodes`
→ Lists all worker nodes available in the cluster.

`kubectl describe node <node-name>`
→ Shows detailed information about a specific node.

`kubectl top nodes`
→ Displays CPU and memory usage of nodes (requires metrics server).

---

# 3️⃣ Pod Commands

`kubectl get pods`
→ Lists pods running in the default namespace.

`kubectl get pods -A`
→ Lists pods from all namespaces.

`kubectl describe pod <pod-name>`
→ Shows detailed information about a specific pod.

`kubectl logs <pod-name>`
→ Displays logs of a container inside a pod.

`kubectl exec -it <pod-name> -- /bin/bash`
→ Opens a terminal session inside a running pod.

`kubectl delete pod <pod-name>`
→ Deletes the specified pod.

---

# 4️⃣ Deployment Commands

`kubectl get deployments`
→ Lists all deployments in the namespace.

`kubectl describe deployment <deployment-name>`
→ Displays detailed information about the deployment.

`kubectl scale deployment <deployment-name> --replicas=3`
→ Changes the number of pod replicas.

`kubectl rollout status deployment <deployment-name>`
→ Shows the rollout status of a deployment update.

`kubectl rollout undo deployment <deployment-name>`
→ Rolls back a deployment to the previous version.

---

# 5️⃣ Service Commands

`kubectl get services`
→ Lists all services in the namespace.

`kubectl describe service <service-name>`
→ Shows detailed information about the service.

---

# 6️⃣ Namespace Commands

`kubectl create namespace dev`
→ Creates a new namespace called **dev**.

`kubectl delete namespace dev`
→ Deletes the **dev namespace** and all resources inside it.

`kubectl get ns`
→ Lists all namespaces in the cluster.

---

# 7️⃣ Manifest File Commands

`kubectl apply -f file.yaml`
→ Creates or updates resources defined in the YAML file.

`kubectl create -f file.yaml`
→ Creates resources from a YAML file.

`kubectl delete -f file.yaml`
→ Deletes resources defined in a YAML file.

`kubectl diff -f file.yaml`
→ Shows differences between the cluster and the YAML file before applying changes.

---

# 8️⃣ Debugging Commands

`kubectl get events`
→ Shows cluster events such as errors and scheduling issues.

`kubectl describe pod <pod-name>`
→ Helps diagnose why a pod failed or crashed.

`kubectl logs <pod-name> -f`
→ Streams live logs from a pod.

---

# 9️⃣ Resource Usage Commands

`kubectl top pods`
→ Displays CPU and memory usage of pods.

`kubectl top nodes`
→ Displays resource usage of cluster nodes.

---

# 🔟 Label and Selector Commands

`kubectl label pod <pod-name> app=nginx`
→ Adds a label to a pod.

`kubectl get pods -l app=nginx`
→ Lists pods with a specific label.

---

# Quick Beginner Command Flow

This is the **typical workflow students use**:

```bash
kubectl get nodes
kubectl get pods
kubectl get ns
kubectl describe pod pod-name
kubectl logs pod-name
kubectl apply -f deployment.yaml
kubectl delete -f deployment.yaml
```

---



 **10 commands are the most important**:

```bash
kubectl get
kubectl describe
kubectl logs
kubectl exec
kubectl apply
kubectl delete
kubectl scale
kubectl rollout
kubectl top
kubectl get events
```

