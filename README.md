# DevOps Kata Deployment

This project is a DevOps Kata deployment setup that demonstrates the use of various tools and practices in a DevOps environment. It includes a sample Go application, Helm charts for deployment, and Terraform configurations for infrastructure management.

## Purpose

The purpose of this project is to provide a comprehensive example of how to set up a CI/CD pipeline using Jenkins and GitHub Actions, deploy applications using Helm, and manage infrastructure with Terraform.

## Project Structure

- **.github/workflows/docker-build-push.yml**: GitHub Actions workflow for building and pushing the Docker image.
- **charts/**: Contains Helm charts for the application and infrastructure.
- **infrastructure/**: Contains Terraform configurations for setting up Kubernetes resources.
- **sample-app/**: Contains the source code for the sample Go application.
- **Jenkinsfile**: Defines the Jenkins pipeline for continuous integration and deployment.
- **README.md**: Documentation for the project.

## Setup Instructions

1. **Clone the repository**:
   ```bash
   git clone https://github.com/example/devops-kata.git
   cd devops-kata
   ```

2. **Build the Docker image**:
   ```bash
   make docker-build
   ```

3. **Deploy the application**:
   - Using Helm:
     ```bash
     helm upgrade --install app-release charts/app
     ```

4. **Run Terraform to set up infrastructure**:
   ```bash
   cd infrastructure
   terraform init
   terraform apply
   ```

## Usage

Once the application is deployed, you can access it at `http://<your-kubernetes-cluster-ip>:8080`. The application exposes a `/metrics` endpoint for Prometheus monitoring.

## License

This project is licensed under the MIT License. See the LICENSE file for more details.