variable "compartment_id" {
  description = "ID do compartimento onde o banco de dados será criado"
  type        = string
}

variable "availability_domain" {
  description = "Domínio de disponibilidade onde o banco de dados será provisionado"
  type        = string
}

variable "admin_password" {
  description = "Senha do administrador do banco de dados"
  type        = string
}

variable "db_name" {
  description = "Nome do banco de dados"
  type        = string
  default     = "devopsdb"
}

variable "db_shape" {
  description = "Forma do banco de dados (quantidade de OCPUs e memória)"
  type        = string
  default     = "VM.Standard2.1"
}

variable "db_storage_size" {
  description = "Tamanho do armazenamento do banco de dados em GB"
  type        = number
  default     = 50
}

variable "freeform_tags" {
  description = "Tags adicionais para organização"
  type        = map(string)
  default     = {}
}
