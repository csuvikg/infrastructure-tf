module "networking" {
  source = "./networking"

  region   = var.region
  vpc_cidr = var.vpc_cidr
}

module "bastion" {
  source = "./bastion"

  # Networking
  vpc_id      = module.networking.vpc_id
  subnet_id   = module.networking.subnet_id_dmz_1
  egress_cidr = module.networking.cidr_frontend_1

  # Instance
  ami = data.aws_ssm_parameter.ubuntu_ami.insecure_value
}

module "database" {
  source = "./database"

  # Networking
  vpc_id       = module.networking.vpc_id
  subnet_ids   = [module.networking.subnet_id_backend_1, module.networking.subnet_id_backend_2]
  ingress_cidr = module.networking.cidr_frontend_1

  # Instance
  db_username = var.db_username
  db_password = var.db_password
}

module "server" {
  source = "./server"

  # Networking
  vpc_id             = module.networking.vpc_id
  elb_subnet_ids     = [module.networking.subnet_id_dmz_1, module.networking.subnet_id_dmz_2]
  server_subnet_id   = module.networking.subnet_id_frontend_1
  server_subnet_cidr = module.networking.cidr_frontend_1

  # Instance
  ami = data.aws_ssm_parameter.ubuntu_ami.insecure_value
}
