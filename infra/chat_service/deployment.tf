resource "kubernetes_deployment" "chat_service" {
  metadata {
    name = "chat-service"

    labels = {
      app  = "chat_service"
      role = "broadcast"
      tier = "backend"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app  = "chat_service"
        role = "broadcast"
        tier = "backend"
      }
    }

    template {
      metadata {
        labels = {
          app  = "chat_service"
          role = "broadcast"
          tier = "backend"
        }
      }
      spec {
        container {
          image             = "chat_service:latest"
          name              = "chat-service"
          image_pull_policy = "Never"

          env {
            name = "PORT"
            value = 8081
          }

          port {
            container_port = 8081
          }

          resources {
            requests {
              cpu    = "100m"
              memory = "100Mi"
            }
          }
        }
      }
    }
  }
}