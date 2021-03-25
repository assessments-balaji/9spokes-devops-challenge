module "eks" {
  source = "git::https://github.com/WesleyCharlesBlake/terraform-aws-eks.git"

  aws-region          = "us-east-1"
  availability-zones  = ["us-east-1a", "us-east-1b", "us-east-1c"]
  cluster-name        = "my-cluster"
  k8s-version         = "1.17"
  node-instance-type  = "t3.medium"
  root-block-size     = "40"
  desired-capacity    = "3"
  max-size            = "3"
  min-size            = "3"
  vpc-subnet-cidr     = "10.0.0.0/16"
  private-subnet-cidr = ["10.0.0.0/19", "10.0.32.0/19", "10.0.64.0/19"]
  public-subnet-cidr  = ["10.0.128.0/20", "10.0.144.0/20", "10.0.160.0/20"]
  db-subnet-cidr      = ["10.0.192.0/21", "10.0.200.0/21", "10.0.208.0/21"]
  eks-cw-logging      = ["api", "audit", "authenticator", "controllerManager", "scheduler"]
}

output "kubeconfig" {
  value = module.eks.kubeconfig
}

output "config-map" {
  value = module.eks.config-map-aws-auth
}
