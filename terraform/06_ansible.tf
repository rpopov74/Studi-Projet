resource "null_resource" "openvpn_server" {
  triggers = {
    always_run = timestamp()
  }
  provisioner "local-exec" {
    command = <<-EOT
      echo > /tmp/openvpn.ini;
      echo "[openvpn]" | tee -a /tmp/openvpn.ini;
      echo "openvpn ansible_host=${openstack_networking_floatingip_v2.floatip_1.address}" | tee -a /tmp/openvpn.ini;
      ANSIBLE_CONFIG=../ansible/ansible.cfg ansible-playbook -u debian -i /tmp/openvpn.ini --private-key ~/.ssh/popov.key ../ansible/playbook_ovpn_server.yml;
      rm -f /tmp/openvpn.ini;
    EOT
  }
    depends_on = [openstack_compute_instance_v2.openvpn,openstack_networking_floatingip_v2.floatip_1,openstack_compute_floatingip_associate_v2.fip_assoc]
}

resource "null_resource" "create_new_vpn_client" {
  for_each = toset(var.vpn_user_list)
    triggers = {
      name = each.value
      always_run = timestamp()
    }
  
  provisioner "local-exec" {
    command = <<-EOT
      echo > /tmp/openvpn.ini;
      echo "[openvpn]" | tee -a /tmp/openvpn.ini;
      echo "openvpn ansible_host=${openstack_networking_floatingip_v2.floatip_1.address}" | tee -a /tmp/openvpn.ini;
      ANSIBLE_CONFIG=../ansible/ansible.cfg ansible-playbook -u debian -i /tmp/openvpn.ini --private-key ~/.ssh/popov.key -e vpn_user_list=${each.value} ../ansible/playbook_ovpn_client.yml;
      rm -f /tmp/openvpn.ini;
    EOT
  }
  depends_on = [openstack_compute_instance_v2.openvpn,null_resource.openvpn_server,openstack_networking_floatingip_v2.floatip_1,openstack_compute_floatingip_associate_v2.fip_assoc]
}
