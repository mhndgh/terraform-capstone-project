
resource "alicloud_ecs_key_pair" "http" {
  key_pair_name = "key"
  key_file      = "key.pem"
}
