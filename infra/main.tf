# module "chat_broadcast_sse" {
#   source = "./chat_broadcast_sse"
#
#   host     = var.host
#   username = var.username
#
#   client_certificate     = var.client_certificate
#   client_key             = var.client_key
#   cluster_ca_certificate = var.cluster_ca_certificate
#   mqtt_public_ip = module.mqtt.mqtt_public_ip
# }
#
# module "chat_service" {
#   source = "./chat_service"
#
#   host     = var.host
#   username = var.username
#
#   client_certificate     = var.client_certificate
#   client_key             = var.client_key
#   cluster_ca_certificate = var.cluster_ca_certificate
#   mqtt_public_ip = module.mqtt.mqtt_public_ip
# }
#
module "mqtt" {
  source = "./mqtt"

  pub_key = var.pub_key
  priv_key = var.priv_key

  aws_access_key_id     = var.aws_access_key_id
  aws_secret_access_key = var.aws_secret_access_key
  aws_region            = var.aws_region

  ansible_playbook = var.ansible_playbook
}
