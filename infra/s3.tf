resource "aws_s3_bucket" "my_bucket_remote_4" {
    bucket = "${var.env}-${var.bucket_name}"

    tags = {
        name = "${var.env}-${var.bucket_name}"
        Environment = var.env
    }
}