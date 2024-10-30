
resource "alicloud_ecs_key_pair" "http" {
  key_pair_name = "http"
  key_file      = "http1.pem"
}
