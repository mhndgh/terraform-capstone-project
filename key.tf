
resource "alicloud_ecs_key_pair" "http" {
  key_pair_name = "key1"
  key_file      = "key1.pem"
}
