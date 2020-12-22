resource "aws_s3_bucket" "S3BucketFront" {
  bucket = "s3bucketfront${var.environment}${var.appname}"
  region = var.region
  acl = "private"
  policy = file("policy_s3front.json")
  website {
    index_document = "index.html"
    error_document = "index.html"
  }
  versioning {
    enabled = true
  }
  tags = {
    Project = "${var.appname}"
  }
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}


resource "aws_s3_bucket" "S3BucketCodePipeline" {
  bucket = "s3bucketcodepipeline${var.environment}${var.appname}"
  region = var.region
  acl = "private"
  policy = file("policy_s3codepipeline.json")
  versioning {
    enabled = true
  }
  tags = {
    Project = "${var.appname}"
  }
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

resource "aws_s3_bucket_public_access_block" "S3BucketCodePipeline" {
  bucket = aws_s3_bucket.S3BucketCodePipeline.id
  block_public_acls   = true
  block_public_policy = true
  ignore_public_acls = true
  restrict_public_buckets = true
}
