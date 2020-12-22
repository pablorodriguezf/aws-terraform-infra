##----------------------------------------------------
##   VARIABLES VPC
##----------------------------------------------------

variable "cidr_vpc" {
  default = "10.156.60.0/24"
}
#two options default and dedicated
variable "tenacy" {
  default = "default"
}
#enable_dns_support default is true
variable "dnssupport" {
  type    = bool
  default = true
}
#enable_dns_hostnames  default false
variable "dnshostnames" {
  type    = bool
  default = true
}
variable "vpc_name" {
  type    = string
  default = "snd.euc1.network.vpc"
}
##----------------------------------------------------
##   VARIABLES SUBNETS
##----------------------------------------------------
variable "azs" {
  description = "The AZs associated with the VPC."
  type        = list(string)
  default     = ["eu-central-1c", "eu-central-1a", "eu-central-1b"]
}

variable "priv_subnets" {
  description = "The subnets privates associated with the VPC."
  type        = list(string)
  default     = ["10.156.60.96/27", "10.156.60.128/27", "10.156.60.160/27"]
}

variable "publ_subnets" {
  description = "The subnets publics associated with the VPC"
  type        = list(string)
  default     = ["10.156.60.0/27", "10.156.60.32/27", "10.156.60.64/27"]
}

variable "names_priv"{
  description = "the name subnets privates"
  type        = list(string)
  default     = ["snd.euc1.private-az1.subnet","snd.euc1.private-az2.subnet", "snd.euc1.private-az3.subnet" ]
}

variable "names_public"{
  description = "the name subnets privates"
  type        = list(string)
  default     = ["snd.euc1.public-az1.subnet","snd.euc1.public-az2.subnet", "snd.euc1.public-az3.subnet" ]
}

##----------------------------------------------------
##   VARIABLES ACLs
##----------------------------------------------------
variable "name_acls" {
  type    = list(string)
  default = ["snd.euc1.private-az1.networkacl","snd.euc1.private-az2.networkacl","snd.euc1.private-az3.networkacl","snd.euc1.public-az1.networkacl","snd.euc1.public-az2.networkacl","snd.euc1.public-az3.networkacl"]
}
