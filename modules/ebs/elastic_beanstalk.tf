resource "aws_elastic_beanstalk_application" "application" {
  name = "${var.appname}"
  stage = "${var.environment}"
}

resource "aws_elastic_beanstalk_environment" "environment" {
  name                = "${var.appname}-${var.environment}"
  region	      = "${var.region}"
  application         = "${var.appname}-${var.environment}"
  solution_stack_name = "64bit Amazon Linux 2 v3.1.3 running Python 3.7"
  cname_prefix        = "${var.appname}-${var.environment}.${var.region}.elasticbeanstalk.com"
  description         = "This is the ${var.environment} for ${var.appname} application"

  availability_zone_selector         = "Any 2"
  
  instance_type           = "t3.small"
  autoscale_min           = 1
  autoscale_max           = 2
  #updating_min_in_service = 0
  #updating_max_batch      = 1
  loadbalancer_type       = "application"
  
  #vpc_id                  = module.vpc.vpc_id
  #loadbalancer_subnets    = module.subnets.public_subnet_ids
  #application_subnets     = module.subnets.private_subnet_ids

  setting {
     namespace = "aws:elbv2:loadbalancer"
     name = "SecurityGroups"
     value = "${aws_security_group.eb-lb-security-group.id}"
  }
  setting {
     namespace = "aws:elbv2:loadbalancer"
     name = "ManagedSecurityGroup"
     value = "${aws_security_group.eb-lb-security-group.id}"
  }

  additional_settings = [
      {
        namespace = "aws:elasticbeanstalk:application:environment"
        name      = "DB_HOST"
        value     = "xxxxxxxxxxxxxx"
      },
      {
        namespace = "aws:elasticbeanstalk:application:environment"
        name      = "DB_USERNAME"
        value     = "yyyyyyyyyyyyy"
      },
      {
        namespace = "aws:elasticbeanstalk:application:environment"
        name      = "DB_PASSWORD"
        value     = "zzzzzzzzzzzzzzzzzzz"
      },
      {
        namespace = "aws:elasticbeanstalk:application:environment"
        name      = "ANOTHER_ENV_VAR"
        value     = "123456789"
      }
    ]


}
