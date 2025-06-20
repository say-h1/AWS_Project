output "cluster_name" {
  description = "EKS cluster name"
  value       = aws_eks_cluster.univ_eks.name
}

output "cluster_endpoint" {
  description = "EKS cluster API server endpoint"
  value       = aws_eks_cluster.univ_eks.endpoint
}

output "cluster_ca" {
  description = "EKS cluster CA (certificate authority data)"
  value       = aws_eks_cluster.univ_eks.certificate_authority[0].data
}

output "cluster_arn" {
  description = "EKS cluster ARN"
  value       = aws_eks_cluster.univ_eks.arn
}

output "cluster_role_name" {
  description = "IAM role name for EKS"
  value       = aws_iam_role.univ_eks_role.name
}

output "node_group_role_arn" {
  value = aws_iam_role.univ_nodegroup_role.arn
}

output "oidc_provider_arn" {
  description = "OIDC provider ARN"
  value       = aws_iam_openid_connect_provider.oidc.arn
}
