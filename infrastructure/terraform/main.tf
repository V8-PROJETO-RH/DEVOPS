module "vcn_prod" {
  source         = "./modules/vcn"
  compartment_id = var.compartment_prod
  vcn_name       = "vcn-prod"
  subnet_name    = "subnet-prod"
}

module "vcn_dev" {
  source         = "./modules/vcn"
  compartment_id = var.compartment_dev
  vcn_name       = "vcn-dev"
  subnet_name    = "subnet-dev"
}

module "compute_prod" {
  source              = "./modules/compute"
  compartment_id      = var.compartment_prod
  availability_domain = "Uocm:US-ASHBURN-AD-1"
  instance_name       = "compute-prod-instance"
  image_id            = "ocid1.image.oc1.."
  ssh_keys            = var.ssh_keys
}

module "compute_dev" {
  source              = "./modules/compute"
  compartment_id      = var.compartment_dev
  availability_domain = "Uocm:US-ASHBURN-AD-1"
  instance_name       = "compute-dev-instance"
  image_id            = "ocid1.image.oc1.."
  ssh_keys            = var.ssh_keys
}

module "db_prod" {
  source              = "./database"
  compartment_id      = var.compartment_prod
  availability_domain = "Uocm:US-ASHBURN-AD-1"
  admin_password      = var.admin_password
  db_name             = "db_prod"
}

module "db_dev" {
  source              = "./database"
  compartment_id      = var.compartment_dev
  availability_domain = "Uocm:US-ASHBURN-AD-1"
  admin_password      = var.admin_password
  db_name             = "db_dev"
}

module "vcn_moitoring" {
  source         = "./modules/vcn"
  compartment_id = var.compartment_monitoring
  vcn_name       = "vcn-monitoring"
  subnet_name    = "subnet-monitoring"
}

module "compute_monitoring" {
  source = "./modules/compute"
  compartment_id = var.compartment_monitoring
  availability_domain = "Uocm:US-ASHBURN-AD-1"
  instance_name = "monitoring-instance"
  image_id = "ocid1.image.oc1.."
  ssh_keys = var.ssh_keys
  user_data = file("../../../monitoring/elastic-kibana.sh")
}