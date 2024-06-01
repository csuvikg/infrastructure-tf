module "networking" {
  source = "./networking"

  region   = "eu-central-1"
  vpc_cidr = "10.250.0.0"
}
