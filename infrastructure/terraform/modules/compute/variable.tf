variable "compartment_id" {
  description = "ID do compartimento onde a instância será criada"
  type        = string
}

variable "availability_domain" {
  description = "Domínio de disponibilidade onde a instância será provisionada"
  type        = string
}

variable "instance_name" {
  description = "Nome da instância de computação"
  type        = string
  default     = "devops-instance"
}

variable "image_id" {
  description = "ID da imagem usada para criar a instância"
  type        = string
}

variable "ssh_keys" {
  description = "Chave pública SSH para acesso à instância"
  type        = string
}

variable "shape" {
  description = "Shape da instância de computação (ex: VM.Standard2.1)"
  type        = string
  default     = "VM.Standard2.1"
}

variable "freeform_tags" {
  description = "Tags adicionais para organização"
  type        = map(string)
  default     = {}
}
