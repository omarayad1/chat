resource "kubernetes_service" "message_api" {
  metadata {
    name = "chat-service"
  }
  spec {
    selector = "${kubernetes_deployment.chat_service.spec.0.template.0.metadata.0.labels}"
    session_affinity = "ClientIP"
    port {
      port        = 8081
      target_port = 8081
    }

    type = "ClusterIP"
  }
}
