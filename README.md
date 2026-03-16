# GKE Autoscaling Node.js App with MongoDB Replica Set on VMs

This project deploys a Node.js app on Google Kubernetes Engine with Horizontal Pod Autoscaling and connects it to a MongoDB replica set running on three Compute Engine instances. The infrastructure is provisioned with Terraform, and the app is exposed externally via Kubernetes Ingress with HTTP and HTTPS.

## Architecture
```
Internet
   ↓
GCP HTTP(S) Load Balancer
   ↓
Kubernetes Ingress
   ↓
ClusterIP Service
   ↓
Node.js Pods on GKE
   ↓
MongoDB Replica Set on 3 Compute Engine VMs
   ├── mongo-1: Primary
   ├── mongo-2: Secondary
   └── mongo-3: Arbiter
```

## Quick Start
### Prerequisites
- Google Cloud SDK (`gcloud`) configured
- Terraform (>=1.5)
- Docker
- kubectl

### Setup Steps
1. Provision the infrastructure
```
cd terraform
terraform init
terraform apply
```
2. Configure MongoDB on the VM instances as for the README in `mongo/`
3. Build and push the Node.js image
```
cd nodeapp
docker build -t <your-image> .
docker push <your-image>
```
4. Deploy the app to GKE as for the README in `kubernetes/`
- the deployment need to be changed to pull the correct image
5. Access the app by using the external IP in the browser
```
kubectl get ingress
```

## Cleanup
1. Delete kubernetes resources
```
kubectl delete -f kubernetes/
```
- the most important is to delete the ingress
2. Destroy the infrastracture
```
cd terraform
terrafrom destroy
```



