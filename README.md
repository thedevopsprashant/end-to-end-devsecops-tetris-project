# 🚀 End-to-End DevSecOps Kubernetes Project 🌐



![Infrastructure Diagram](assets/Infra.gif)

Welcome to an immersive DevSecOps learning experience! This project guides you through deploying a Tetris game on AWS EKS while mastering the art of DevSecOps.

## Directories 📂

1. **EKS-TF:** Explore Terraform scripts for deploying EKS clusters on AWS.
2. **Jenkins-Pipeline-Code:** Jenkins pipeline code for automated CI/CD.
3. **Jenkins-Server-TF:** Terraform scripts for provisioning Jenkins servers on AWS EC2.
4. **deployments:** Kubernetes manifest files for Tetris application deployment.
5. **Tetris-V1:** Initial version of the Tetris game application.
6. **Tetris-V2:** Enhanced version of the Tetris game application.

## Getting Started 🚀

1. **Clone the Repository:**
   ```bash
   git clone https://github.com/thedevopsprashant/end-to-end-devsecops-tetris-project.git
2. **Explore the Directories:**
   Navigate into each directory to find detailed scripts, pipelines, and configurations.


## Tools Explored 🛠️
1. **Jenkins:** Automated CI/CD pipelines
2. **Terraform:** Infrastructure as Code for AWS EKS
3. **EKS Kubernetes:** Orchestration for containerized applications
4. **ArgoCD:** Continuous deployment to Kubernetes
5. **SonarQube:** Unveiling code quality insights
6. **Docker:** Containerized application deployment
7. **Trivy:** Container vulnerability scanner
8. **OWASP Dependency-Check:** Ensuring secure dependencies



## Acknowledgments 🙌
   Special Thanks to the open-source community and Aman Pathak for the medium blog, the contributors who make learning and collaboration an incredible journey.

## Steps To Do the Practical
1. Go to Jenkins-Server-TF, Create the Jenkins server using TF - Run tf init, tf plan, tf apply.
2. Now setup the jenkins server install required addons, Install and Configure tools/plugins on Jenkins server.

**Install Jenkins Plugins:**
* aws creds
* pipeline step
* pipeline stage view
* rebuilder
* docker 
* docker common
* docker api
* sonarqube scanner

 Add Jenkins global credentials for: aws-key, sonar-token, github, docker. \
 Configure Jenkins System tools for Sonar, docker. \
 Configure Project and generate token on Sonar. \
 Create Dockerhub repo for the App.

3. Create/Configure Jenkins pipeline to create the EKS cluster using terraform. In folder 'Jenkins-Pipeline-Code', use Jenkinsfile-EKS-Terraform to configure the jenkins pipeline. Then Run the pipeline to create EKS Cluster. This will take around 15mins.
4. Configure the App pipeline, In folder 'Jenkins-Pipeline-Code', use Jenkinsfile-TetrisV1. Run the pipeline
5. Install ArgoCD and ALB Controller using Helm on EKS cluster.

6. Run below on Jenkins Ubuntu Server:
``` bash
aws configure
aws eks update-kubeconfig --name Tetris-EKS-Cluster --region ap-south-1

#Install helm on Ubuntu
sudo snap install helm --classic
helm version

#Install argocd on Ubuntu
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d && echo
```

7. Open and Login in ArgoCd, Create a App on ArgoCd add the /deployments files for the deployment. Create it.
8. Open AWS, Get the Loadbalancer DNS for the app LB, Access it. Tetris Game should be accessible.


**Optional: Docker Commands to build multi-arch supported Docker Images:**
``` bash
docker buildx build --platform linux/amd64 -t prashantsharma288/tetrisv1:2 .
docker buildx build --platform linux/amd64,linux/arm64 -t prashantsharma288/tetrisv1:2 .
```

