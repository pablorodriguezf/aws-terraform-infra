##----------------------------------------------------
##   VARIABLES ROUTES TABLES
##----------------------------------------------------
variable "vpc_id" {}
variable "id_igw" {}
variable "id_nat" {}
variable "all_tags" {}
variable "count_publics_ids" {}
variable "count_privates_ids" {}
variable "subnets_privates_ids" {}
variable "subnets_publics_ids" {}


variable "name_rtbs_priv"{
  description  = "the name routes tables"
  type         = list(string)
  default      = ["sdntest.euc1.private-az1.rtb", "sdntest.euc1.private-az2.rtb", "sdntest.euc1.private-az3.rtb"]
}
variable "name_rtbs_public"{
  description  = "the name routes tables"
  type         = list(string)
  default      = ["sdntest.euc1.public-az1.rtb","sdntest.euc1.public-az2.rtb","sdntest.euc1.public-az3.rtb"]
}