output "vcn_prod_id" {
  description = "ID da VCN de produção"
  value       = module.vcn_prod.vcn_id
}

output "vcn_dev_id" {
  description = "ID da VCN de desenvolvimento"
  value       = module.vcn_dev.vcn_id
}

output "compute_prod_public_ip" {
  description = "IP público da instância de produção"
  value       = module.compute_prod.public_ip
}

output "compute_dev_public_ip" {
  description = "IP público da instância de desenvolvimento"
  value       = module.compute_dev.public_ip
}

output "db_prod_id" {
  description = "ID do banco de dados de produção"
  value       = module.db_prod.db_system_id
}

output "db_dev_id" {
  description = "ID do banco de dados de desenvolvimento"
  value       = module.db_dev.db_system_id
}