In Kubernetes, **HPA** and **VPA** are autoscaling methods used to automatically adjust resources based on workload.

---

# 1️⃣ HPA (Horizontal Pod Autoscaler)

**HPA** automatically **increases or decreases the number of pods** based on resource usage like CPU or memory.

### Example

If traffic increases:

* Pods increase from **2 → 5**

If traffic decreases:

* Pods decrease from **5 → 2**

### Example Command

```bash
kubectl autoscale deployment nginx-deployment --cpu-percent=50 --min=2 --max=10
```

Check HPA:

```bash
kubectl get hpa
```

### Example YAML

```yaml
apiVersion: autoscaling/v2
kind: HorizontalPodAutoscaler
metadata:
  name: nginx-hpa
spec:
  scaleTargetRef:
    apiVersion: apps/v1
    kind: Deployment
    name: nginx-deployment
  minReplicas: 2
  maxReplicas: 10
```

---

# 2️⃣ VPA (Vertical Pod Autoscaler)

**VPA** automatically **adjusts CPU and memory resources of a pod** instead of increasing the number of pods.

Example:

* CPU changes from **200m → 500m**
* Memory changes from **256Mi → 512Mi**

Instead of creating more pods, it **increases resources of existing pods**.

### Example VPA YAML

```yaml
apiVersion: autoscaling.k8s.io/v1
kind: VerticalPodAutoscaler
metadata:
  name: nginx-vpa
spec:
  targetRef:
    apiVersion: apps/v1
    kind: Deployment
    name: nginx-deployment
```

Check VPA:

```bash
kubectl get vpa
```

---

# Key Difference

| Feature      | HPA                 | VPA                     |
| ------------ | ------------------- | ----------------------- |
| Scaling Type | Horizontal          | Vertical                |
| What changes | Number of Pods      | CPU & Memory            |
| Example      | 2 Pods → 6 Pods     | 200m CPU → 500m CPU     |
| Use Case     | Handle traffic load | Optimize resource usage |

---

✅ **Simple Summary**

* **HPA** → Adds or removes **pods** based on load.
* **VPA** → Increases or decreases **CPU & memory** of a pod.

---

💡 **DevOps Interview Tip:**
In real production environments, teams usually prefer **HPA**, because **VPA can restart pods when changing resources**.

---

If you want, I can also explain **Cluster Autoscaler vs HPA vs VPA** (a **very common Kubernetes interview question**).
