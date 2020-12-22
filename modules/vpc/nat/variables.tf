##----------------------------------------------------
##   VARIABLES NAT
##----------------------------------------------------
variable "name_nat" {
  type    = string
  default = "snd.euc1.public-az1.ngw"
}
variable "vpc_id" {}
variable "all_tags" {}
variable "subnets_public_ids" {}
variable "eip_allocation_id" {}

