variable "vpc_id" {
  type = string
}

variable "elb_subnet_id" {
  type = string
}

variable "server_subnet_id" {
  type = string
}

variable "server_subnet_cidr" {
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

variable "app_port" {
  type = number
  default = 8080
}

variable "app_port_protocol" {
  type = string
  default = "HTTP"
}

variable "external_port" {
  type = number
  default = 443
}

variable "external_port_protocol" {
  type = string
  default = "HTTPS"
}
