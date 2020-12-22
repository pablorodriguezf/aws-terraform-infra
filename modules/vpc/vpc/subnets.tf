resource "aws_subnet" "subnets_privates" {
  count                   =  length(var.priv_subnets)
  vpc_id                  =  aws_vpc.vpc.id
  availability_zone       =  element(var.azs,count.index)
  cidr_block              =  element(var.priv_subnets,count.index)
  #map_public_ip_on_launch = "true"
  tags = merge(
    local.tags,
    {
      Name    = format("%s",element(var.names_priv,count.index))
      Service = "subnet"
      Description = "Create subnets privates"
    }
  )
}

resource "aws_subnet" "subnets_public" {
  count                   =  length(var.publ_subnets)
  vpc_id                  =  aws_vpc.vpc.id
  availability_zone       =  element(var.azs,count.index)
  cidr_block              =  element(var.publ_subnets,count.index)
 # map_public_ip_on_launch = "true"

  tags = merge(
    local.tags,
    {
      Name        = format("%s", element(var.names_public,count.index))
      Service     = "subnet"
      Description = "Create subnets publics"
    }
   )
}
