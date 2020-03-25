resource "kubernetes_deployment" "chat_broadcast_sse" {
  metadata {
    name = "chat-broadcast-sse"

    labels = {
      app  = "chat_broadcast_sse"
      role = "broadcast"
      tier = "backend"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app  = "chat_broadcast_sse"
        role = "broadcast"
        tier = "backend"
      }
    }

    template {
      metadata {
        labels = {
          app  = "chat_broadcast_sse"
          role = "broadcast"
          tier = "backend"
        }
      }
      spec {
        container {
          image             = "chat_broadcast_sse:latest"
          name              = "chat-broadcast-sse"
          image_pull_policy = "Never"

          env {
            name = "MQTT_BROKER_URL"
            value = "tcp://${var.mqtt_public_ip}:61613"
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
