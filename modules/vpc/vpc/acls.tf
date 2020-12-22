# create VPC Network access control list
resource "aws_network_acl" "rules_acls" {
  vpc_id     = aws_vpc.vpc.id
  count      = length(var.name_acls)
  subnet_ids = ["${element(concat(aws_subnet.subnets_privates.*.id,aws_subnet.subnets_public.*.id),count.index)}"]
  # allow ingress ephemeral ports
  ingress {
    protocol = -1
    rule_no = 1000
    action = "allow"
    cidr_block = "0.0.0.0/0"
    from_port = 0
    to_port = 0
  }

  # allow egress ephemeral ports
  egress {
    protocol = -1
    rule_no = 1000
    action = "allow"
    cidr_block = "0.0.0.0/0"
    from_port = 0
    to_port = 0
  }
  tags = merge(
   local.tags,
   {
    Name = format("%s", var.name_acls[count.index])
    Service = "ACLs"
    Description = "Create ACLs"
   }
  )
}

