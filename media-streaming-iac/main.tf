provider "aws" {
  region = "ap-northeast-1"  # Region for all resources
}

resource "aws_s3_bucket" "media_bucket" {
  bucket = "media-streaming-bucket-nishant-unique-2024"
}

# Add website configuration in a separate resource
resource "aws_s3_bucket_website_configuration" "media_bucket_website" {
  bucket = aws_s3_bucket.media_bucket.id

  index_document {
    suffix = "index.html"
  }
}

# Add a bucket policy to allow public read access to the S3 bucket
resource "aws_s3_bucket_policy" "media_bucket_policy" {
  bucket = aws_s3_bucket.media_bucket.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Principal = "*",
      Action = "s3:GetObject",
      Resource = "${aws_s3_bucket.media_bucket.arn}/*"
    }]
  })
}

# Update public access block to allow public policies
resource "aws_s3_bucket_public_access_block" "media_bucket_public_access_block" {
  bucket = aws_s3_bucket.media_bucket.id

  block_public_acls       = true
  block_public_policy     = false  # Set to false to allow public policies
  ignore_public_acls      = true
  restrict_public_buckets = false
}

resource "aws_iam_role" "lambda_exec" {
  name = "lambda_exec_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action    = "sts:AssumeRole",
      Effect    = "Allow",
      Principal = {
        Service = "lambda.amazonaws.com"
      }
    }]
  })
}

resource "aws_iam_role_policy_attachment" "lambda_exec_attach" {
  role       = aws_iam_role.lambda_exec.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_lambda_function" "media_lambda" {
  function_name = "MediaLambda"
  runtime       = "nodejs18.x"
  handler       = "index.handler"
  role          = aws_iam_role.lambda_exec.arn

  filename      = "/home/nishant/Project/Solative/media-streaming-iac/lambda_function.zip"
}

resource "aws_api_gateway_rest_api" "media_api" {
  name        = "Media API"
  description = "API Gateway for media streaming"
}

resource "aws_cloudfront_distribution" "media_distribution" {
  origin {
    domain_name = aws_s3_bucket.media_bucket.bucket_regional_domain_name
    origin_id   = "S3-media-origin"
  }

  enabled = true

  default_cache_behavior {
    allowed_methods        = ["GET", "HEAD"]
    cached_methods         = ["GET", "HEAD"]
    target_origin_id       = "S3-media-origin"
    viewer_protocol_policy = "redirect-to-https"

    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }
}
