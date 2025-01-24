variable "tenancy_ocid" {
  description = "OCID do Tenancy na OCI"
  type        = string
  default     = ""
}

variable "user_ocid" {
  description = "OCID do Usuário na OCI"
  type        = string
  default     = ""
}

variable "fingerprint" {
  description = "Fingerprint da chave pública usada na autenticação"
  type        = string
  default     = ""
}

variable "private_key_path" {
  description = "Caminho para a chave privada usada na autenticação"
  type        = string
  default     = ""
}

variable "region" {
  description = "Região da OCI"
  type        = string
  default     = ""
}

variable "compartment_prod" {
  description = "OCID do compartimento de produção"
  type        = string
  default     = ""
}

variable "compartment_dev" {
  description = "OCID do compartimento de desenvolvimento"
  type        = string
  default     = ""
}

variable "ssh_keys" {
  description = "Chave pública SSH para acessar as instâncias"
  type        = string
  default     = ""
}

variable "admin_password" {
  description = "Senha do administrador do banco de dados"
  type        = string
  default     = ""
}