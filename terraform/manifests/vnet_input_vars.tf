variable "vnet_name" {
  default     = "az-vnet-particle41"
  description = "Virtual network name"
  type        = string
}

variable "vnet_address_space" {
  default     = ["10.0.0.0/16"]
  description = "Virtual network address space"
  type        = list(string)
}


variable "private_subnets" {
  type = map(string)
  default = {
    "private_snet_1" = "10.0.0.0/24"
    "private_snet_2" = "10.0.1.0/24"
  }

}

variable "public_subnets" {
  type = map(string)
  default = {
    "public_snet_1" = "10.0.2.0/24"
    "public_snet_2" = "10.0.3.0/24"
  }

}

# Keeping these variables value in here as these are not sensitive data
# Ideally, all the default values has to be in .tfvars file, and I will not be commiting the tfvars to public repo
