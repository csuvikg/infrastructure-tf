variable "vpc_id" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

variable "ingress_cidr" {
  type    = string
  default = "0.0.0.0/0"
}

variable "egress_cidr" {
  type    = string
  default = "0.0.0.0/0"
}

variable "db_type" {
  type    = string
  default = "mysql"
}

variable "db_version" {
  type    = string
  default = "8.0"
}

variable "db_instance_type" {
  type    = string
  default = "db.t3.micro"
}

variable "db_volume_size_gb" {
  type    = number
  default = 20
}

variable "db_username" {
  type = string
}

variable "db_password" {
  type = string
}
