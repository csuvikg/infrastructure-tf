variable "region" {
  type = string
}

variable "vpc_cidr" {
  type = string
  description = "A /16 CIDR range, eg. 10.250.0.0/16"
}
