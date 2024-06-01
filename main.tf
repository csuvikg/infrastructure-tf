module "networking" {
  source = "./networking"

  region   = var.region
  vpc_cidr = var.vpc_cidr
}

module "bastion" {
  source = "./bastion"

  # Networking
  vpc_id      = module.networking.vpc_id
  subnet_id   = module.networking.subnet_id_dmz
  egress_cidr = module.networking.cidr_frontend

  # Instance
  ami = data.aws_ssm_parameter.ubuntu_ami
}

module "database" {
  source = "./database"

  # Networking
  vpc_id       = module.networking.vpc_id
  subnet_id    = module.networking.subnet_id_backend
  ingress_cidr = module.networking.cidr_frontend

  # Instance
  db_username = var.db_username
  db_password = var.db_password
}

module "server" {
  source = "./server"

  # Networking
  vpc_id             = module.networking.vpc_id
  elb_subnet_id      = module.networking.subnet_id_dmz
  server_subnet_id   = module.networking.subnet_id_frontend
  server_subnet_cidr = module.networking.cidr_frontend

  # Instance
  ami = data.aws_ssm_parameter.ubuntu_ami
}
