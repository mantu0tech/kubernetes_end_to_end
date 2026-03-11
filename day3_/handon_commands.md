Good idea to explain these commands briefly before moving to **YAML manifest files** in Kubernetes. Here are **simple one-line explanations** you can show students.

---

### Kubernetes Basic Commands (One-Line Explanation)

`kubectl get namespace`
→ Lists all namespaces available in the cluster.

`kubectl get ns`
→ Short command to display all namespaces.

`kubectl get cluster`
→ Not a valid standard command (Kubernetes resources are not listed this way).

`kind get cluster`
→ Incorrect command; used mistakenly when checking clusters in Kind.

`kind get clusters`
→ Shows all Kubernetes clusters created using Kind.

`kubectl get pods`
→ Displays all pods running in the default namespace.

`kubectl get pods -n kube-system`
→ Shows pods running in the **kube-system namespace** (Kubernetes internal components).

`kubectl create ns nginx`
→ Creates a new namespace named **nginx**.

`kubectl get ns`
→ Displays all namespaces again to verify creation.

`kubectl run nginx --image=nginx`
→ Creates and runs a pod named **nginx** using the nginx container image.

`kubectl get pods`
→ Lists pods running in the default namespace.

`kubectl get pods -n nginx`
→ Shows pods running inside the **nginx namespace**.

`kubectl delete pod nginx`
→ Deletes the pod named **nginx** from the default namespace.

`kubectl run nginx --image=nginx -n nginx`
→ Creates a pod named **nginx** inside the **nginx namespace**.

`kubectl get pods -n nginx`
→ Lists all pods inside the nginx namespace.

---

### Important Note for Students

These commands are **mainly used for testing or learning**.

In real environments we usually create resources using **YAML manifest files** and apply them with:

```bash
kubectl apply -f manifest.yaml
```

This approach is better because it allows:

* Version control (Git)
* Easy updates
* Repeatable deployments
* Infrastructure as code

---
