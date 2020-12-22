locals {
  tags = {
    "Owner Area"          = "bonding"
    Account               = "snd"
    Description           = "Creación de la vpc"
    Environment           = "snd"
    "Owner Business Unit" = "spain"
    "Project ID"          = "bonding portal"
    "Project Role"        = "network"
    Region                = "eu-central-1"
    Service               = "vpc"
    "Project Build"       = "terraform v0.1.1"
  }
}

resource "aws_vpc" "vpc" {
  cidr_block          = var.cidr_vpc
  instance_tenancy    = var.tenacy
  enable_dns_support  = var.dnssupport
  enable_dns_hostnames= var.dnshostnames
  tags = merge(
    local.tags,
    {
      Name = format("%s", var.vpc_name)
    }
  )
}
