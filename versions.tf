terraform {
  required_version = "~> 0.12"

  required_providers {
    aws      = "~> 2.5"
    null     = "~> 2.0"
    template = "~> 2.0"
    random   = ">= 2.2"
  }
}