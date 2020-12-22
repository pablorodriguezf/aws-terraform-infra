resource "aws_nat_gateway" "nat" {
  allocation_id =  var.eip_allocation_id
  subnet_id     =  var.subnets_public_ids[0].id
  tags = merge(
    var.all_tags,
    {
      Name    = format("%s", var.name_nat)
      Service = "nat"
      Description = "Create nat"
    }
   )
}

