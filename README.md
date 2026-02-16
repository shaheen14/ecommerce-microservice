## 7-Day DevOps Challenge – Full Lifecycle
📍 Demonstrated practical DevOps workflow from Linux automation to CI/CD deployment.
✅ Tools: Docker, Kubernetes, Prometheus, Grafana, ELK, GitHub Actions
📍 Highlights: Automated builds, container orchestration, monitoring & logging

### 📘 Day 1 – Linux & Git Setup (DevOps 7-Day Project)

This repository is part of a 7-Day DevOps Master Project, where I build a complete microservice + CI/CD + Monitoring + Logging + Kubernetes deployment.

**🚀 Today's Objectives**

+ Learn Linux basics required for a DevOps Engineer

+ Learn essential Git commands

+ Automate system setup using bash scripting

+ Push changes to GitHub as part of real project workflow


📂 **Work Completed Today**

1️⃣ Project Initialization

+ Created project folder: ecommerce-microservice/

+ Initialized a Git repository using:

+ git init

2️⃣ Created Automation Scripts

+ ✔ setup.sh

+ Installs commonly used DevOps tools (Docker, kubectl, MySQL client).

+ ✔ check_port.sh

+ Checks whether a specific port is already in use.

+ Run example:
```bash
./check_port.sh 8080
```
3️⃣ Git Operations

+ Added files to staging:

+ git add .


+ Committed changes:
```bash
git commit -m "Day 1: Linux + Git setup completed"
```

+ Connected to GitHub and pushed the code.

📝 **Assignments Completed Today**

- Wrote a system health script (system_health.sh)

- Created a new Git branch and a Pull Request

- Wrote explanations for Linux basics:

    + Shell

    + Absolute vs relative path

    + Exit status ( echo $?)

    + kill vs kill -9

📚 **Key Learning From Day 1**

+ How Linux handles files, processes, permissions

+ How to use Git for version control

+ How to write practical bash scripts

+ How to organize DevOps project repository


## Day 2 – Docker (Containerization)

### Service
Ecommerce Microservice API (Flask)

### Endpoint
GET /sales

### Build Image
```bash
docker build -t ecommerce-microservice:1.0 .
```

### Run Container
```bash
docker run -p 8000:8000 -e APP_PORT=8000 ecommerce-microservice:1.0
```

### Docker Hub Image
```bash
docker pull shaheen14/ecommerce-microservice:1.0
```

### Environment Variables
```bash
APP_PORT – Application port (default: 8000)
```
**Access API**

http://localhost:8000/sales

**Notes**

* Uses Python 3.11 base image

* .dockerignore added to reduce image size

## Day 3 – SQL + Docker Compose

### Run with Docker Compose
```bash
docker-compose up --build
```
**Services**

* Flask API

* PostgreSQL database

**Endpoint**

GET /sales

**Persistence**

PostgreSQL data stored using Docker volumes


**✅ Day 4 – Kubernetes (Deployment & Scaling)**

**🎯** Objective****

 Deploy the ecommerce microservice with PostgreSQL on Kubernetes using Minikube, and demonstrate scaling and load balancing.

🔧** Tools Used**

* Kubernetes (Minikube)

* kubectl

* Docker

* PostgreSQL

* ConfigMap

**🏗️ Kubernetes Components**

* Deployment

  * ecommerce-api (Flask application)

  * postgres (PostgreSQL database)

* Service

  * ecommerce-api → NodePort

  * postgres → ClusterIP

* ConfigMap

   * Application configuration

   * PostgreSQL environment variables (learning purpose)

🚀 **Deployment Steps**
```bash
kubectl apply -f k8s/configmap.yaml
kubectl apply -f k8s/postgres-deployment.yaml
kubectl apply -f k8s/postgres-service.yaml
kubectl apply -f k8s/api-deployment.yaml
kubectl apply -f k8s/ap-service.yaml
```

**Verify:**
```bash
kubectl get pods
kubectl get svc
```

🌐 **Accessing the Application**

minikube service ecommerce-api


**Open in browser:**

  /sales  

**🔁 Scaling Assignment**


* Scale application from 1 to 3 replicas:
```bash
kubectl scale deployment ecommerce-api --replicas=3
kubectl get pods
```

* Scale down:
```bash
kubectl scale deployment ecommerce-api --replicas=1
```

✔ **Verified that Kubernetes Service load-balances traffic across replicas**.

**🐞 Debugging (CrashLoopBackOff)**

* PostgreSQL pod initially failed due to missing required environment variables

* PostgreSQL requires POSTGRES_* variables at startup

* Issue resolved by correcting ConfigMap variable names

**🧠 Key Learnings**

* Difference between stateless (API) and stateful (DB) workloads

* How Kubernetes handles scaling and self-healing

* Importance of correct environment variable naming per container image

* Role of Deployments, Services, and ConfigMaps

**📌 Notes**

* ConfigMaps were used for credentials for learning purposes

* In production, Kubernetes Secrets should be used for sensitive data.


## Day 5 – Monitoring (Grafana)

- Installed Prometheus and Grafana on Kubernetes
- Configured Prometheus as Grafana data source
- Visualized pod and node metrics using Grafana dashboards


```bash
kubectl apply -f monitoring/
```
**Port forwarding**
```bash
kubectl port-forward svc/prometheus 9090:9090
```

## 📅 Day 6 – Centralized Logging

**ELK Stack (Elasticsearch + Kibana)**

Project: ecommerce-microservice

**🎯 Day 6 Objective**

The goal of Day 6 was to:

* Implement centralized logging for the ecommerce-microservice

* Deploy and understand the ELK stack in Kubernetes

* Visualize application logs using Kibana

* Keep the setup aligned with real-world DevOps practices

        
     **   **🧱 Architecture Overview****

        
        ecommerce-api (Kubernetes Pod)
                |
                |  stdout / stderr logs
                v
        Elasticsearch
                |
                v
        Kibana (Log Search & Visualization)
  
        

**🔹 ELK Stack Components**

1️⃣ Elasticsearch

* Stores and indexes logs

* Runs inside Kubernetes
  
    ```bash
    kubectl apply -f elk/
    ```
    Verify:
    
    ```bash 
    kubectl get pods -n logging
    ```

2️⃣ Kibana

* UI for searching and visualizing logs

* Connected to Elasticsearch service

Access Kibana:
```bash
kubectl port-forward -n logging svc/kibana 5601:5601
```

**Open in browser:**
```bash
http://localhost:5601
```
🔹 **Namespace Used**
```bash
kubectl create namespace logging
```

All ELK components run inside the logging namespace.

**🔹 Log Collection Strategy**

* Kubernetes container logs (stdout / stderr)

* Logs produced by ecommerce-api pods

* Indexed directly by Elasticsearch

* No Logstash used to keep setup lightweight

This approach is common in Kubernetes environments where log collectors or agents are used instead of Logstash.


🛠️** Issues Faced & Fixes**

| Issue                      | Fix                                       |
| -------------------------- | ----------------------------------------- |
|                            |                                           |
| Disk space full            | Moved Docker & Minikube data to new disk  |
| Kibana stuck loading       | Waited for ES to reach healthy state      |
| High resource usage        | Restarted Minikube with sufficient memory |

✔ ELK stack deployed successfully
✔ Centralized logging enabled
✔ Integrated with ecommerce-microservice
✔ Kubernetes-native logging understood

🧠** Key Learnings**

* ELK stack is resource-heavy and needs tuning

* Elasticsearch must be healthy before Kibana starts

* Centralized logging is critical for debugging microservices

* Kubernetes logs are best handled centrally, not per container

* Logstash is optional depending on architecture# Day 7 – CI/CD + Revision + Mock Interview

### Day 7 – CI/CD

Day 7 focuses on **CI/CD fundamentals** using **GitHub Actions**. The goal is to automate **build & image delivery**, not direct cluster deployment.

---

## 🎯 Objectives of Day 7

* Understand CI vs CD clearly
* Implement a real GitHub Actions pipeline
* Build & push Docker images automatically
* Avoid unsafe deployment to local Minikube from cloud runners

---

## 🧠 CI/CD Strategy Used (Important)

### ❌ What we did NOT do

* No direct deployment to Minikube from GitHub Actions
* No kubeconfig or Minikube certificates in CI

> Reason: Minikube is a **local cluster** and GitHub runners are **remote cloud VMs**.

### ✅ What we implemented

| Stage          | Tool               |
| -------------- | ------------------ |
| Source Control | GitHub             |
| CI Pipeline    | GitHub Actions     |
| Image Build    | Docker             |
| Image Registry | Docker Hub         |
| CD (Local)     | kubectl + Minikube |

---

## 🔁 CI Pipeline Flow

1. Developer pushes code to `main` branch
2. GitHub Actions triggers automatically
3. Pipeline performs:

   * Code checkout
   * Docker Hub authentication
   * Docker image build
   * Docker image push
4. Pipeline completes successfully
5. Deployment is handled manually on Minikube

---

## ⚙️ GitHub Actions Workflow Used

```yaml
name: Build and Push Docker Image

on:
  push:
    branches: [ "main" ]

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
    - name: Checkout code
      uses: actions/checkout@v3

    - name: Login to Docker Hub
      uses: docker/login-action@v3
      with:
        username: ${{ secrets.DOCKER_USERNAME }}
        password: ${{ secrets.DOCKER_PASSWORD }}

    - name: Build Docker image
      run: |
        docker build -t shaheen/ecommerce-microservice:latest .

    - name: Push Docker image
      run: |
        docker push shaheen/ecommerce-microservice:latest
```

---

## 🚀 Deployment (Local CD)

After pipeline success:

```bash
minikube start
kubectl apply -f k8s/
``
---

## 🧪 Verification

```bash
kubectl get pods
kubectl get svc

```

Ensure:

* Pods are running
* Image is pulled from Docker Hub
* Application is accessible


<img width="1277" height="621" alt="Screenshot from 2025-12-19 01-48-54" src="https://github.com/user-attachments/assets/771538d2-416a-4a1f-bdf7-af94e0f0e3f2" />

<img width="1277" height="621" alt="Screenshot from 2025-12-19 01-50-26" src="https://github.com/user-attachments/assets/3000add2-487b-4fee-a0dd-b4102af98fad" />

<img width="1277" height="621" alt="Screenshot from 2025-12-19 01-50-50" src="https://github.com/user-attachments/assets/423dc044-20b3-4117-986e-792758f0e9cb" />
<img width="1165" height="707" alt="Screenshot from 2025-12-19 01-58-40" src="https://github.com/user-attachments/assets/d2f69908-7dbc-4856-bbdf-07835431b652" />




---

## 💡 Points to Considered (Very Important)

* GitHub Actions is used only for **CI**
* Docker images are versioned and pushed automatically
* Minikube is not exposed to the internet
* Deployment is decoupled from CI for safety
* This approach mirrors real-world learning environments

---

## 🔁 Complete Project Timeline Recap

| Day   | Topic                |
| ----- | -------------------- |
| Day 1 | Linux + Git          |
| Day 2 | Docker               |
| Day 3 | SQL                  |
| Day 4 | Kubernetes           |
| Day 5 | Prometheus + Grafana |
| Day 6 | ELK Stack            |
| Day 7 | CI/CD + Revision     |

---

## ✅ Day 7 Status

✔ CI pipeline working without errors
✔ Docker images pushed automatically
✔ Manual CD to Minikube successful

---

## 🎉 Final Note

This project demonstrates **end-to-end DevOps fundamentals** using a single evolving microservice.
