output "vpc_id" {
  value = "${aws_vpc.vpc.id}"
}
output "all_tags" {
  value = {
    "Owner Area"          = "bonding"
    Account               = "snd"
    Description           = "Creación de la vpc"
    Environment           = "snd"
    "Owner Business Unit" = "spain"
    "Project ID"          = "bonding portal"
    "Project Role"        = "network"
    Region                = "eu-central-1"
    "Project Build"       = "terraform v0.1.1"
  }
}
output "subnets_publics_ids" {
  value = aws_subnet.subnets_public
}
output "subnets_privates_ids" {
  value = aws_subnet.subnets_privates
}

output "count_privates_ids" {
  value = length(var.priv_subnets)
}
output "count_publics_ids" {
  value = length(var.publ_subnets)
}

output "subnet_private"{
 #  value = element(concat(aws_subnet.subnets_privates.*.id, [""]), 0)
 value = aws_subnet.subnets_privates.*.id  
}
