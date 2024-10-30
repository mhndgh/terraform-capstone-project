resource "alicloud_instance" "mysql" {
  availability_zone = data.alicloud_zones.availability_zones.zones.0.id
  security_groups = [alicloud_security_group.mysql.id]

  # series III
  instance_type              = "ecs.g6.large"
  system_disk_category       = "cloud_essd"
  image_id                   = "ubuntu_24_04_x64_20G_alibase_20240812.vhd"
  instance_name              = "mysql"
  vswitch_id                 = alicloud_vswitch.private.id
  instance_charge_type       = "PostPaid"
  key_name                   = alicloud_ecs_key_pair.http.key_pair_name
  internet_max_bandwidth_out = 0
  user_data = base64encode(file("mysql-setup.sh"))

}

output "mysql_server_private_ip" {
  value = alicloud_instance.mysql.private_ip
}