# Variáveis globais
variable "region" {
  description = "Região da OCI"
  type        = string
  default     = ""
}

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
  default     = "~/.oci/private_key.pem"
}

# Compartimentos
variable "compartment_id" {
  description = "OCID do compartimento onde os recursos serão criados"
  type        = string
  default     = ""
}

variable "availability_domain" {
  description = "Domínio de disponibilidade na OCI"
  type        = string
  default     = "Uocm:PHX-AD-1" 
}

# Variáveis de instância Compute
variable "instance_shape" {
  description = "Shape da instância Compute "
  type        = string
  default     = "VM.Standard.E4.Flex"
}

variable "image_id" {
  description = "OCID da imagem usada para a instância Compute"
  type        = string
  default     = "ocid1.image.oc1.." 
}

variable "ssh_public_key" {
  description = "Caminho para a chave pública SSH"
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}

variable "subnet_id" {
  description = "OCID da subnet onde a instância será criada"
  type        = string
  default     = ""
}