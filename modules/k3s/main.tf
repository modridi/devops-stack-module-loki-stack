module "loki-stack" {
  source = "../"

  cluster_name     = var.cluster_name
  base_domain      = var.base_domain
  argocd_namespace = var.argocd_namespace

  namespace      = var.namespace
  profiles       = var.profiles

  extra_yaml = [ templatefile("${path.module}/values.yaml", {
    cluster_name     = var.cluster_name,
    base_domain      = var.base_domain,
    minio_access_key = var.minio.access_key,
    minio_secret_key = var.minio.secret_key,
  }) ]
}
