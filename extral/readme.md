# Kubernetes Namespaces, Manifests, CRUD, CronJobs, HPA, and Helm

## What is a Namespace?

A **Namespace** is a logical isolation mechanism in Kubernetes used to organize and separate resources within the same cluster.

Namespaces allow:
- Resource isolation
- Environment separation (dev, test, prod)
- Access control
- Better resource management

Namespaces do NOT provide:
- Node isolation
- Network isolation by default

Every Kubernetes object belongs to a namespace (except cluster-wide objects).

---

## Namespace Commands

Create a namespace:
