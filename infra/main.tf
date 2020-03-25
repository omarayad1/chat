module "chat_broadcast_sse" {
  source = "./chat_broadcast_sse"

  host     = var.host
  username = var.username

  client_certificate     = var.client_certificate
  client_key             = var.client_key
  cluster_ca_certificate = var.cluster_ca_certificate
}
