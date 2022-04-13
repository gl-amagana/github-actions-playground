locals {
  bucket_name = "AndrewsCoolBucket"
}

data "aws_caller_identity" "current" {}

resource "aws_s3_bucket" "foo-bucket" {
  region        = "us-east-1"
  bucket        = local.bucket_name
  force_destroy = true

  tags = {
    Name = "foo-${data.aws_caller_identity.current.account_id}"
  }
  versioning {
    enabled = true
  }
  logging {
    target_bucket = aws_s3_bucket.log_bucket.id
    target_prefix = "log/"
  }
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
  acl = "private"
}

resource "aws_s3_bucket" "log_bucket" {
  bucket = "SomeRandomLogBucket"
}