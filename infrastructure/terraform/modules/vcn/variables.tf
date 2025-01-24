variable "compartment_id" {
  description = "ID do compartimento onde a VCN será criada"
  type        = string
}

variable "vcn_name" {
  description = "Nome da VCN"
  type        = string
  default     = "devops-vcn"
}

variable "vcn_cidr_block" {
  description = "Bloco CIDR da VCN"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_name" {
  description = "Nome da sub-rede"
  type        = string
  default     = "default-subnet"
}

variable "subnet_cidr_block" {
  description = "Bloco CIDR da sub-rede"
  type        = string
  default     = "10.0.1.0/24"
}

variable "freeform_tags" {
  description = "Tags adicionais para organização"
  type        = map(string)
  default     = {}
}
