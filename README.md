# 9Spokes DevSecOps Challenge

## Create EKS Cluster in AWS and create staging namespace

```bash
$ cd terraform
$ terraform init
$ terraform plan
$ terraform apply

$ mkdir ~/.kube
$ terraform output kubeconfig > ~/.kube/eks-cluster
$ export KUBECONFIG=~/.kube/eks-cluster

$ kubectl get nodes

$ kubectl create namespace staging
```

## Build and push docker image to docker hub

```bash
$ cd hello
$ docker build -t manojg0521/9spokes-challenge:latest .
$ docker login # login with dockerhub credentials
$ docker push manojg0521/9spokes-challenge:latest
```
## Single Pod

```bash
$ cd k8s
$ kubectl apply -f single-pod.yaml
```

### Multi-node

```bash
$ cd k8s
$ kubectl apply -f multinode.yaml
```

### Multi-container Pod

```bash
$ cd k8s
$ kubectl apply -f multi-container-pod.yaml
```
