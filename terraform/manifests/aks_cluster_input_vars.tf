variable "cluster_name" {
  type        = string
  description = "AKS cluster name"
  default     = "particle41-aks-cluster"
}

variable "selected_subnet_key" {
  description = "The key of the subnet to use for the AKS cluster"
  type        = string
  default     = "private_snet_1" # Set your desired subnet key here
}