📘 Day 1 – Linux & Git Setup (DevOps 7-Day Project)

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

