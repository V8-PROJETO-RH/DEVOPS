output "elastic_kibana_instance_ip" {
  value = oci_core_instance.elastic_kibana.public_ip
}

output "elastic_kibana_instance_ocid" {
  value = oci_core_instance.elastic_kibana.id
}
