Here are **simple notes and commands for RBAC (Role-Based Access Control)** in Kubernetes.

---

# RBAC (Role-Based Access Control) in Kubernetes

**RBAC** is used to **control who can access or modify resources in Kubernetes**.

It defines **permissions for users, groups, or service accounts**.

Example:
You can allow a user to **only view pods**, but not delete them.

---

# Main Components of RBAC

## 1️⃣ Role

A **Role** defines permissions **within a specific namespace**.

Example: Allow access to view pods.

### Example Role YAML

```yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  namespace: nginx
  name: pod-reader
rules:
- apiGroups: [""]
  resources: ["pods"]
  verbs: ["get", "watch", "list"]
```

Create role:

```bash
kubectl apply -f role.yml
```

Check roles:

```bash
kubectl get roles -n nginx
```

---

## 2️⃣ RoleBinding

A **RoleBinding** connects a **Role to a user, group, or service account**.

### Example RoleBinding YAML

```yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: read-pods
  namespace: nginx
subjects:
- kind: User
  name: dev-user
  apiGroup: rbac.authorization.k8s.io
roleRef:
  kind: Role
  name: pod-reader
  apiGroup: rbac.authorization.k8s.io
```

Create role binding:

```bash
kubectl apply -f rolebinding.yml
```

Check rolebindings:

```bash
kubectl get rolebindings -n nginx
```

---

# Cluster Level RBAC

## 3️⃣ ClusterRole

A **ClusterRole** gives permissions **across the entire cluster**, not just one namespace.

Example: Access nodes.

### Example YAML

```yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
  name: node-reader
rules:
- apiGroups: [""]
  resources: ["nodes"]
  verbs: ["get","watch","list"]
```

Create:

```bash
kubectl apply -f clusterrole.yml
```

Check:

```bash
kubectl get clusterroles
```

---

## 4️⃣ ClusterRoleBinding

This binds a **ClusterRole to a user or service account**.

### Example YAML

```yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: node-access
subjects:
- kind: User
  name: admin-user
  apiGroup: rbac.authorization.k8s.io
roleRef:
  kind: ClusterRole
  name: node-reader
  apiGroup: rbac.authorization.k8s.io
```

Create:

```bash
kubectl apply -f clusterrolebinding.yml
```

Check:

```bash
kubectl get clusterrolebindings
```

---

# Useful RBAC Commands

Check API resources:

```bash
kubectl api-resources
```

Check permissions for a user:

```bash
kubectl auth can-i get pods
```

Example:

```bash
kubectl auth can-i delete pods
```

Check roles:

```bash
kubectl get roles
```

Check cluster roles:

```bash
kubectl get clusterroles
```

---

# Simple Summary

| Component          | Purpose                      |
| ------------------ | ---------------------------- |
| Role               | Permissions in a namespace   |
| RoleBinding        | Connect role to user         |
| ClusterRole        | Permissions across cluster   |
| ClusterRoleBinding | Connect cluster role to user |

---

✅ **In simple words:**
RBAC in Kubernetes controls **who can do what inside the cluster**.

Example:

* Developer → View pods
* Admin → Full cluster access

---

