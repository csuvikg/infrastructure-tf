variable "region" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "db_username" {
  type = string
  default = "admin"
}

variable "db_password" {
  type = string
}
