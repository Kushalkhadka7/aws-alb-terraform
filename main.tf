terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

module "alb" {
  source = "./alb"

  name                        = "Application-Load-Balancer"
  internal                    = var.internal
  load_balancer_type          = var.load_balancer_type
  security_groups             = [aws_security_group.elb_security_group.id]
  cross_zone_load_balancing   = var.cross_zone_load_balancing
  idle_timeout                = var.idle_timeout
  connection_draining         = var.connection_draining
  connection_draining_timeout = var.connection_draining_timeout
  subnets                     = data.aws_vpc.selected.id
  enable_http2                = var.enable_http2
  enable_access_logs          = var.enable_access_logs
  alb_logs_bucket_name        = var.alb_logs_bucket_name
  alb_logs_bucket_prefix      = var.alb_logs_bucket_prefix
  alb_env                     = var.alb_env
  alb_listener_port           = var.alb_listener_port
  alb_listener_protocol       = var.alb_listener_protocol
  route_path_pattern          = var.route_path_pattern
}
