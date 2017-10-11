##ALB Logging Bucket

resource "aws_s3_bucket" "alb_logging_bucket" {
    acl =               "log-delivery-write"
    bucket =            "${var.aws_region}-${lower(var.environment)}-alb-logging-bucket"
    force_destroy =     true
    policy =            "${data.template_file.tpl_s3_alb_logging_policy.rendered}"

    depends_on =        [ "data.template_file.tpl_s3_alb_logging_policy" ]

    tags {
        Environment =   "${var.environment}"
        Name =          "alb_logging_bucket_${var.environment}"
    }
}


# ALB Logging Access to S3

data "template_file" "tpl_s3_alb_logging_policy" {
    template = "${file("${path.module}/resources/policies/s3-alb-logging-policy.json")}"
    vars {
        aws_account_number =    "${var.aws_account_number}"
        alb_logging_bucket = 	"${var.aws_region}-${lower(var.environment)}-alb-logging-bucket"
        alb_account_number =    "${lookup(var.alb_account_number, var.aws_region)}"
    }
}
