# DevOps Kata Deployment

This project is a DevOps Kata deployment setup that demonstrates the use of various tools and practices in a DevOps environment. It includes a sample Go application, Helm charts for deployment, and Terraform configurations for infrastructure management.

## Purpose

The purpose of this project is to provide a comprehensive example of how to set up a CI/CD pipeline using Jenkins and GitHub Actions, deploy applications using Helm, and manage infrastructure with Terraform.

# DevOps Kata: CI/CD + Kubernetes Observability Stack

This project showcases a complete deployment pipeline and infrastructure-as-code system using:

- **Jenkins**
- **Helm**
- **OpenTofu**
- **Kubernetes (Minikube or any cluster)**
- **Prometheus & Grafana**
- **Go Sample Application**

---

## 📦 Project Structure

```
.
├── charts/
│   ├── app/                # Helm chart for sample app
│   └── infra/              # Helm chart for Prometheus & Grafana
├── infrastructure/         # OpenTofu (Terraform-compatible) modules
├── sample-app/             # Go-based web app with Prometheus metrics
├── Jenkinsfile             # Jenkins CI pipeline
├── .github/workflows/      # GitHub Actions CI for Docker build & push
```

---

## ⚙️ Prerequisites

- Docker
- Minikube or other Kubernetes cluster
- Helm
- OpenTofu (`brew install opentofu`)
- Go 1.21+
- Jenkins (optional, for pipeline execution)
- `kubectl`, `make`, `git`

---

## 🚀 Quickstart

### 1. Create Namespaces

```bash
cd infrastructure
tofu init
tofu apply -auto-approve -var="kubeconfig=~/.kube/config"
```

### 2. Build and Deploy App

```bash
cd sample-app
make build
make docker-build
make docker-push
```

### 3. Install Monitoring Stack

```bash
helm upgrade --install monitoring ./charts/infra -n infra --create-namespace
```

### 4. Install Application

```bash
helm upgrade --install app-release ./charts/app -n apps --create-namespace
```

### 5. Test Helm Release

```bash
helm test app-release -n apps
```

---

## 🔍 Observability

- **Prometheus**: Auto-discovers metrics from apps via `ServiceMonitor`
- **Grafana**:
  - URL: `http://<grafana-service>:80`
  - Default login: `admin / prom-operator`
  - Auto-imports dashboard `gnetId: 1860`

---

## 🧪 CI/CD Pipelines

### 🐳 GitHub Actions

Defined in `.github/workflows/docker-build-push.yml`:
- Builds Docker image on every push to `main`
- Pushes to DockerHub

Secrets required:
- `DOCKER_USERNAME`
- `DOCKER_PASSWORD`

### 🔁 Jenkins Pipeline

Use the `Jenkinsfile` to automate:
- Checkout
- Testing
- OpenTofu validation + apply
- Helm deployments for infra and app

---

## 🛠️ Make Targets

From inside `sample-app/`:

```bash
make         # build binary
make test    # run unit tests
make docker-build
make docker-push
```

---

## 📈 Metrics Endpoint

Sample app exposes:
- `GET /`: Hello message
- `GET /metrics`: Prometheus metrics

---

## 📚 Stack Versioning

| Tool        | Version  |
|-------------|----------|
| Helm        | ≥ v3.12  |
| OpenTofu    | ≥ v1.6   |
| Kubernetes  | ≥ v1.27  |
| Go          | 1.21     |
| Prometheus  | 15.0.0   |
| Grafana     | 6.17.4   |

---

## 🧹 Cleanup

```bash
helm uninstall monitoring -n infra
helm uninstall app-release -n apps
kubectl delete ns infra apps
```

---

## 🧠 Inspiration

Built from scratch as a DevOps learning kata. Inspired by real-world patterns and minimal boilerplate.