resource "oci_database_db_system" "db_system" {
  compartment_id      = var.compartment_id
  availability_domain = var.availability_domain
  shape               = "VM.Standard2.1"
  admin_password      = var.admin_password
  db_home {
    db_version   = "19c"
    display_name = "devops-db"
    database {
      db_name = var.db_name
    }
  }
  output "db_system_id" {
    value = oci_database_db_system.db_system.id
  }
}
