# 🚀 Assessment Project — Next.js Deployment on Kubernetes Cluster

This project demonstrates the **containerization and deployment** of a **Next.js application** using **Docker**, **GitHub Actions**, and a **Kubernetes cluster** (master and worker nodes) hosted on AWS EC2 instances.  
The CI/CD pipeline builds and pushes Docker images to **GitHub Container Registry (GHCR)** automatically.

# Setup Instructions
### 1️ Clone the Repository

bash
git clone https://github.com/Prince730-creator/Assessment.git
cd Assessment

Assessment/
├── Dockerfile
├── deployment.yaml
├── git/
│       └── docker-ghcr.yaml
├── package.json
└── README.md

### 2 Install Docker
 sudo apt install -y docker.io 

### 3 Install Kuberentes cluster 
 on Master node
chmod 777 k8s-master.sh
./k8s-master.sh

on Worker nodes
chmod 777 k8s-nodes.sh
./k8s-nodes.sh

# Local Run commands 
 Cloning the git repo 
   -  git clone 
 Run Next.js app
   -npm install
   -npm run dev
Build and Push docker images
  -docker build -t ghcr.io/prince730-creator/nextjs-app:latest .
 - docker login ghcr.io
 - docker tag nextjs-app:latest ghcr.io/Prince730-creator/project:latest
 - docker push ghcr.io/prince730-creator/project:latest
Deployment with Kubernetes
  -vi deployment.yaml
  - kubectl apply -f deployment.yaml
  -  kubectl get pods
  - deploy : Nodeport = 3000:30001/TCP

# Pull docker images 
  docker pull ghcr.io/prince730-creator/nextjs-app:latest
 

 



