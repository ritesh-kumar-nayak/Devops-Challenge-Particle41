variable "azure_lb" {
  type        = string
  description = "Azure Load Balancer"
  default     = "particle41-lb"

}

variable "lb_public_ip" {
  type        = string
  default     = "particle41-lb-publicIp"
  description = "Public IP for Azure Load Balancer"

}

variable "backend_pool" {
  type        = string
  default     = "az-lb-backenpool"
  description = "Public IP for Azure Load Balancer"

}

variable "selected_public_subnet_key" {
  default     = "public_snet_1"
  type        = string
  description = "Public subnet where LB has to be deployed"

}