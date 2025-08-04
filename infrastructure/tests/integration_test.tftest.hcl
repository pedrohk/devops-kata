test "infra_namespaces" {
  run = "tofu apply -auto-approve"
  assert {
    condition = "kubernetes_namespace.infra != null && kubernetes_namespace.apps != null"
  }
}