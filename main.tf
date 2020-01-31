# Configure the AWS provider
provider "aws" {
  region = "eu-west-1"
}


# create vpc
resource "aws_vpc" "app_vpc" {
  cidr_block =  "10.0.0.0/16"
  tags = {
    Name = var.name
  }
}


# Internet Gateway
resource "aws_internet_gateway" "app_gw" {
  vpc_id = aws_vpc.app_vpc.id

  tags = {
    Name = "${var.name} - IG"
  }
}

# Call module to create app_tier
module "app" {
  source = "./modules/app_tier"
  vpc_id = aws_vpc.app_vpc.id
  db_instance_ip = module.db.db_instance_ip
  name = var.name
  gateway_id = aws_internet_gateway.app_gw.id
  ami_id = var.ami_id
}


# Call module to create db_tier
module "db" {
  source = "./modules/db_tier"
  vpc_id = aws_vpc.app_vpc.id
  app_sg_id = module.app.app_security_group_id
  name = var.name
  ami_id_mongodb = var.ami_id_mongodb
}
