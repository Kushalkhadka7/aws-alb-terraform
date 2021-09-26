# ALB
internal                    = false
load_balancer_type          = "application"
cross_zone_load_balancing   = true
idle_timeout                = 400
connection_draining         = true
connection_draining_timeout = 400
enable_http2                = false
enable_access_logs          = true
alb_logs_bucket_name        = "load_balancer"
alb_logs_bucket_prefix      = "load_balancer/"
alb_env                     = "dev"

# s3 Bucket
bucket_name        = "kushal-bucket-example1-bucket"
bucket_acl         = "public-read"
env                = "DEV"
enabled_versioning = true
