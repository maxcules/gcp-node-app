## Kubernetes setup

1. create a self-signed certificate or use an existing one.
2. create a Kubernetes TLS secret:
```
kubectl create secret tls nodeapp-tls \
  --cert=tls.crt \
  --key=tls.key
```
3. apply all the resources:
```
kubectl apply -f configmap.yaml
kubectl apply -f deployment.yaml
kubectl apply -f hpa.yaml
kubectl apply -f service.yaml
kubectl apply -f ingress.yaml
```
- it may take a few second for the load balancer to be provisioned



#### Important
delete the ingress resouce before destroying the whole infrastratuce to prevent the load balancer to remain orphaned
```
kubectl delete -f ingress.yaml
```
