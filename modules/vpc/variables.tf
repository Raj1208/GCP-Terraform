

variable "region" {
  type = string
}
variable "vpc_name" {
  type = string
}

variable "availability_zones" {
  type = list(string)
}

variable "public_subnet_cidr" {
  type = list(string)
}

variable "private_subnet_cidr" {
  type = list(string)
}

variable "data_subnet_cidr" {
  type = list(string)
}
