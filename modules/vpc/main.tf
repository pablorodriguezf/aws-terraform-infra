module "vpc" {
  source    = "./vpc/"
}

module "eip" {
  source    = "./eip"
  all_tags  = "${module.vpc.all_tags}"
}

module "igw" {
  source    = "./igw/"
  vpc_id    = "${module.vpc.vpc_id}"
  all_tags  = "${module.vpc.all_tags}"
}

module "nat" {
  source    = "./nat/"
  vpc_id    = "${module.vpc.vpc_id}"
  all_tags  = "${module.vpc.all_tags}"
  subnets_public_ids = "${module.vpc.subnets_publics_ids}"
  eip_allocation_id  = "${module.eip.eip_allocation_id}"
}

resource "time_sleep" "wait_30_seconds" {
  depends_on = [module.nat]
  create_duration = "10s"
}

module "rtb" {
  source     = "./rtb/"
  vpc_id     = "${module.vpc.vpc_id}"
  all_tags   = "${module.vpc.all_tags}"
  id_igw     = "${module.igw.igw_id}"
  id_nat     = "${module.nat.nat_id}"
  subnets_publics_ids = "${module.vpc.subnets_publics_ids}"
  count_privates_ids  = "${module.vpc.count_privates_ids}"
  count_publics_ids   = "${module.vpc.count_publics_ids}"
  subnets_privates_ids= "${module.vpc.subnets_privates_ids}"
}


