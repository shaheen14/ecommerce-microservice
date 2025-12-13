📘 Day 1 – Linux & Git Setup (DevOps 7-Day Project)

This repository is part of a 7-Day DevOps Master Project, where I build a complete microservice + CI/CD + Monitoring + Logging + Kubernetes deployment.

🚀 Today's Objectives

Learn Linux basics required for a DevOps Engineer

Learn essential Git commands

Automate system setup using bash scripting

Push changes to GitHub as part of real project workflow


📂 **Work Completed Today**

1️⃣ **Project Initialization

Created project folder: ecommerce-microservice/

Initialized a Git repository using:

git init

2️⃣ Created Automation Scripts

✔ setup.sh

Installs commonly used DevOps tools (Docker, kubectl, MySQL client).

✔ check_port.sh

Checks whether a specific port is already in use.

Run example:

./check_port.sh 8080

3️⃣ Git Operations

Added files to staging:

git add .


Committed changes:

git commit -m "Day 1: Linux + Git setup completed"


Connected to GitHub and pushed the code.

📝 **Assignments Completed Today**

Wrote a system health script (system_health.sh)

Created a new Git branch and a Pull Request

Wrote explanations for Linux basics:

Shell

Absolute vs relative path

Exit status ( echo $?)

kill vs kill -9

📚 **Key Learning From Day 1**

How Linux handles files, processes, permissions

How to use Git for version control

How to write practical bash scripts

How to organize DevOps project repository


## Day 2 – Docker (Containerization)

### Service
Ecommerce Microservice API (Flask)

### Endpoint
GET /sales

### Build Image
```bash
docker build -t ecommerce-microservice:1.0 .
