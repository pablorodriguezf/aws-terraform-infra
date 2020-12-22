provider "aws" {
  region  = var.region
  version = "~> 2.5"
}

module "s3" {
  source = "./modules/s3"
}

module "ebs" {
  source = "./modules/ebs"
}
