# Kubernates Commands

## Administrative

```
kubectl get nodes
kubectl config get-contexts
kubectl config use-contexts CTX_NAME
kubectl create deployment hello-minikube --image=docker.io/nginx:1.23
kubectl expose deployment hello-minikube --type=NodePort --port=80
kubectl get services hello-minikube
minikube service hello-minikube
kubectl port-forward service/hello-minikube 7080:80

# Simple
kubectl create -f <filename.yml>
kubectl get pod
kubectl get service
kubectl describe pod <pod>
minikube service <name> --url
kubectl describe service <name>
kubectl label pods <pod> mylable=awesome

# Debug
kubectl expose pod <pod> --port=444 --name=frontend  # expose port on remote machine
kubectl expose pod <pod> --type=NodePort --name <name>
kubectl port-forward <pod> 8080:3000  # expose port to local machine
kubectl attach <pod> -i
kubectl exec <pod> -- command
kubectl run -i --tty busybox --image=busybox --restart=Never -- sh

# Replication Controller
kubectl scale --replicas=4 -f ./replication.yml
kubectl get rc
kubectl scale --replicas=1 rc/<app_name>
kubectl delete rc/<app_name>

# Deployment
kubectl get deployments
kubectl get rs
kubectl get pods --show-labels
kubectl rollout status deployment/helloworld-deployment
kubectl set image deployment/helloworld-deployment k8s-demo=k8s-demo:2
kubectl rollout history deployment/helloworld-deployment
kubectl rollout undo deployment/helloworld-deployment [ --to-revision=3 ]
kubectl expose deployment helloworld-deployment --type=NodePort
kubectl get service
kubectl describe service helloworld-deployment
kubectl edit deployment/helloworld-deployment

# Label
kubectl label nodes <node> key=value
kubectl label nodes <node> key-
kubectl get nodes --show-labels

# Secrets
# echo -n "root" > ./user.txt
# echo -n "1234" > ./pass.txt
kubectl create secret generic db-user-pass --from-file=./user.txt --from-file=./pass.txt
kubectl create secret generic ssl-certificate --from-file=ssh-privatekey=~/.ssh/id_rsa --ssl-cert=mysslcert.crt
kubectl create -f secrets.yml
```

## Minikube

```
minikube start
minikube stop
minikube pause
minikube unpause
minikube delete ...

minikube dashboard

```

## kOps

```
kops create cluster --name=aws.uw-biblog.com --state=s3://kops-state-34j9 --zones=us-east-2a --node-count=2 --node-size=t3.micro --master-size=t3.micro --dns-zone=aws.uw-biblog.com

export NAME=aws.uw-biblog.com
export KOPS_STATE_STORE=s3://kops-state-34j9

kops get cluster

kubectl get nodes

kops edit cluster aws.uw-biblog.com --state=s3://kops-state-34j9

kops edit ig --name=aws.uw-biblog.com nodes-us-east-2a

kops edit ig --name=aws.uw-biblog.com master-us-east-2a

kops update cluster --name aws.uw-biblog.com --yes --state=s3://kops-state-34j9 --admin

kops validate cluster --wait 10m

kubectl get nodes --show-labels

ssh -i ~/.ssh/id_rsa ubuntu@api.aws.uw-biblog.com


```

## Topics to learn

Service Discovery

ConfigMap

Ingress Controller

External DNS

Volumes

Volumes Autoprovisioning

Pod Presets

Statueful Sets

Daemon Sets

Resource Usage Monitoring

Autoscaling

Affinity

Interpod Affinity and Anti-affinity

Taints and Tolerations

Custom Resource Definitions

Operators

