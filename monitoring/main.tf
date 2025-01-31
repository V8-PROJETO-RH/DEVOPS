provider "oci" {
  region           = var.region
  tenancy_ocid     = var.tenancy_ocid
  user_data        = var.user_data
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
}

resource "oci_core_instance" "elastic_kibana" {
  compartment_id      = var.compartment_id
  availability_domain = var.availability_domain

  display_name = "elastic-kibana-instance"
  shape        = var.instance_shape

  source_details {
    source_type = "image"
    source_id   = var.image_id
  }

  metadata = {
    ssh_authorized_keys = file(var.ssh_public_key)
    user_data           = base64encode(file("${path.module}/elastic-kibana.sh"))
  }

  create_vnic_details {
    subnet_id        = var.subnet_id
    assign_public_ip = true
    display_name     = "elastic-kibana-vnic"
  }

  tags = {
    "Environment" = "Monitoring"
    "Application" = "Elastic-Kibana"
  }
}
