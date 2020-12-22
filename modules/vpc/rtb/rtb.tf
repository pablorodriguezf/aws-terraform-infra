#---------------------------------------------------------------------------
# Create the Route Table PUBLICS
#---------------------------------------------------------------------------
resource "aws_route_table" "rtb_public" {
  count   = length(var.name_rtbs_public)
  vpc_id  = var.vpc_id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.id_igw
  }
  tags = merge(
    var.all_tags,
    {
      Name    = format("%s", var.name_rtbs_public[count.index])
      Service = "Route tables"
      Description = "Create routes publics"
    }
  )
}

#---------------------------------------------------------------------------
# Create the Route Table PRIVATES
#---------------------------------------------------------------------------

resource "aws_route_table" "rtb_priv" {
  count   = length(var.name_rtbs_priv)
  vpc_id  = var.vpc_id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = var.id_nat.id
  }
  tags    = merge(
    var.all_tags,
    {
      Name    = format("%s", var.name_rtbs_priv[count.index])
      Service = "Route tables"
      Description = "Create routes privates"
    }
  )
}

# Associate the Route Table with the Subnet Public

resource "aws_route_table_association" "merge_association_public" {
  count          =  var.count_publics_ids
  subnet_id      =  element(var.subnets_publics_ids.*.id,count.index)
  route_table_id =  element(aws_route_table.rtb_public.*.id,count.index)
}

# Associate the Route Table with the Subnet Privates
resource "aws_route_table_association" "merge_association_private" {
  count          = var.count_privates_ids
  subnet_id      = element(var.subnets_privates_ids.*.id,count.index)
  route_table_id = element(aws_route_table.rtb_priv.*.id,count.index)
}