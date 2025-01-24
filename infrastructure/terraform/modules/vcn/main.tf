resource "oci_core_vcn" "vcn" {
  compartment_id = var.compartment_id
  cidr_block     = "10.0.0.0/16"
  display_name   = var.vcn_name
}

resource "oci_core_subnet" "subnet" {
  compartment_id             = var.compartment_id
  vcn_id                     = oci_core_vcn.vcn_id
  cird_block                 = "10.0.1.0/24"
  display_name               = var.subnet_name
  prohibit_public_ip_on_vnic = false
}
