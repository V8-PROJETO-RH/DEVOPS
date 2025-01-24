resource "oci_core_instance" "instancia" {
  compartment_id      = var.compartment_id
  availability_domain = var.availability_domain
  shape               = "VM.Standard2.1"
  display_name        = var.instance_name
  source_details {
    source_type = "image"
    source_id   = var.image_id
  }

  metadata = {
    ssh_keys = file(var.ssh_public_key)
  }
  output "public_ip" {
    value = oci_core_instance.instance.public_ip
  }
}
