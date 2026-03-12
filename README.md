# 🚀 End-to-End DevSecOps Kubernetes Project 🌐



![Infrastructure Diagram](assets/Infra.gif)

Welcome to an immersive DevSecOps learning experience! This project guides you through deploying a Tetris game on AWS EKS while mastering the art of DevSecOps.

## Directories 📂

1. **EKS-TF:** Explore Terraform scripts for deploying EKS clusters on AWS.
2. **Jenkins-Pipeline-Code:** Jenkins pipeline code for automated CI/CD.
3. **Jenkins-Server-TF:** Terraform scripts for provisioning Jenkins servers on AWS EC2.
4. **Manifest-file:** Kubernetes manifest files for Tetris application deployment.
5. **Tetris-V1:** Initial version of the Tetris game application.
6. **Tetris-V2:** Enhanced version of the Tetris game application.

## Getting Started 🚀

1. **Clone the Repository:**
   ```bash
   git clone https://github.com/DevSecOps-Tetris-Project.git
2. **Explore the Directories:**
   Navigate into each directory to find detailed scripts, pipelines, and configurations.


## Tools Explored 🛠️
1. **Jenkins:** Automated CI/CD pipelines
2. **ArgoCD:** Continuous deployment to Kubernetes
3. **Kubernetes:** Orchestration for containerized applications
4. **Trivy:** Container vulnerability scanner
5. **OWASP Dependency-Check:** Ensuring secure dependencies
6. **Docker:** Containerized application deployment
7. **SonarQube:** Unveiling code quality insights
8. **Terraform:** Infrastructure as Code for AWS EKS


## Acknowledgments 🙌
   Special Thanks to the open-source community and Aman Pathak for the medium blog, the contributors who make learning and collaboration an incredible journey.

## Steps To Do the Practical
1. Go to Jenkins-Server-TF, Create the Jenkins server using TF - Run tf init, tf plan, tf apply.
2. Now setup the jenkins server install required addons, Install and Configure tools/plugins on Jenkins server.
3. Create Jenkins pipeline to create the EKS cluster using terraform. In folder 'Jenkins-Pipeline-Code', use Jenkinsfile-EKS-Terraform to configure the jenkins pipeline.
4. Configure the App pipeline, In folder 'Jenkins-Pipeline-Code', use Jenkinsfile-
5. Install ArgoCD and ALB Controller using Helm on EKS cluster.

aws configure
aws eks update-kubeconfig --name Tetris-EKS-Cluster --region ap-south-1
# Install helm on Ubuntu
sudo snap install helm --classic
helm version

# Install argocd on Ubuntu
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d && echo
