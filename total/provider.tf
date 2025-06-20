provider "aws" {
  region = "ap-northeast-2"
}

provider "aws" {
  alias  = "use1"
  region = "us-east-1"
}

# EKS 클러스터 정보 조회 (클러스터 생성 이후 동작)
data "aws_eks_cluster" "eks" {
  name = var.eks_cluster_name
}

data "aws_eks_cluster_auth" "eks" {
  name = var.eks_cluster_name
}

# EKS에 연결되는 쿠버네티스 프로바이더 (Helm도 이 연결 사용)
provider "kubernetes" {
  alias                  = "eks"   # 반드시 alias 추가!
  host                   = data.aws_eks_cluster.eks.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.eks.certificate_authority[0].data)
  token                  = data.aws_eks_cluster_auth.eks.token
}

provider "helm" {
  alias = "eks"                   # 반드시 alias 추가!
  kubernetes {
    host                   = data.aws_eks_cluster.eks.endpoint
    cluster_ca_certificate = base64decode(data.aws_eks_cluster.eks.certificate_authority[0].data)
    token                  = data.aws_eks_cluster_auth.eks.token
  }
}
