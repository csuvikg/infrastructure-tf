variable "vpc_id" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "ingress_cidr" {
  type    = string
  default = "0.0.0.0/0"
}

variable "egress_cidr" {
  type    = string
  default = "0.0.0.0/0"
}

variable "ami" {
  type = string
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}
