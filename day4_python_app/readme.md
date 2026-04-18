Here are **simple notes on ConfigMaps and Secrets in** Kubernetes.

---

# ConfigMaps and Secrets in Kubernetes (Simple Notes)

## 1️⃣ ConfigMap

A **ConfigMap** is used to store **non-sensitive configuration data** in Kubernetes.

It allows you to **separate configuration from application code**.

### Examples of data stored in ConfigMaps

* Environment variables
* Application configuration
* URLs
* Port numbers
* Configuration files

### Example ConfigMap YAML

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: app-config
  namespace: nginx
data:
  APP_COLOR: blue
  APP_MODE: production
```

### Create ConfigMap

```bash
kubectl apply -f configmap.yml
```

### Check ConfigMaps

```bash
kubectl get configmaps
```

### Use ConfigMap in Pod

ConfigMap values can be used as:

* **Environment Variables**
* **Mounted Files in Containers**

Example (Environment variable):

```yaml
env:
- name: APP_COLOR
  valueFrom:
    configMapKeyRef:
      name: app-config
      key: APP_COLOR
```

---

# 2️⃣ Secrets

A **Secret** is used to store **sensitive data** securely in Kubernetes.

Secrets are **base64 encoded** and used for confidential information.

### Examples of data stored in Secrets

* Passwords
* Database credentials
* API keys
* SSH keys
* Tokens

### Example Secret YAML

```yaml
apiVersion: v1
kind: Secret
metadata:
  name: db-secret
type: Opaque
data:
  username: YWRtaW4=
  password: cGFzc3dvcmQ=
```

*(Values are base64 encoded)*

### Create Secret

```bash
kubectl apply -f secret.yml
```

### Check Secrets

```bash
kubectl get secrets
```

### Use Secret in Pod

Example:

```yaml
env:
- name: DB_USER
  valueFrom:
    secretKeyRef:
      name: db-secret
      key: username
```

---

# Key Difference

| Feature   | ConfigMap                | Secret               |
| --------- | ------------------------ | -------------------- |
| Purpose   | Store configuration data | Store sensitive data |
| Security  | Not encrypted            | Base64 encoded       |
| Data type | Non-sensitive            | Passwords, tokens    |
| Example   | App settings             | Database credentials |

---

✅ **In Simple Words**

* **ConfigMap** → Stores **normal configuration data**.
* **Secret** → Stores **confidential information like passwords**.

Both help **keep configuration separate from application code**.

---

