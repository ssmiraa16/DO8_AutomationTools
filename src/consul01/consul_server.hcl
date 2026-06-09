datacenter = "dc1"
data_dir = "/opt/consul"
log_level = "INFO"
node_name = "consul-server"
server = true
bootstrap_expect = 1
bind_addr = "192.168.57.10"
advertise_addr = "192.168.57.10"
client_addr = "0.0.0.0"
retry_join = ["192.168.57.10"]
ui_config {
  enabled = true
}
connect {
  enabled = true
}
ports {
  grpc = 8502
}