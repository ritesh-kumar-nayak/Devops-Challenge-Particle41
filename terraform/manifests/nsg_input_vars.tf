variable "public_snet_nsg" {
  type    = string
  default = "public-snet-nsg"
}

variable "allow_http_public_snet" {
  default = "Allow-Http"
  type    = string
}

variable "private_snet_nsg" {
  type    = string
  default = "private-snet-nsg"

}

variable "allow_internal_private_snet" {
  default = "allow-internal"
  type    = string
}