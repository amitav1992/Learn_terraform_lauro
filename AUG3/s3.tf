resource "aws_s3_bucket" "mybucket" {
  bucket = "my-tf-test-bucket-${random_id.bucket_name_suffix.hex}"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
    ManagedBy= "Terraform"
  }
}

resource "random_id" "bucket_name_suffix" {
  
  byte_length = 8
}

# So if you change the name of the bucket in your resource block, Terraform will create a new bucket with the new name.
#Caveat ---- you will habve to apply it twice.

/*
Side note: if you instead change the bucket = "..." string (the actual S3 name), 
that also forces replace, because bucket names are immutable in AWS — the only way to "rename" is destroy + create.
moved {
  from = aws_s3_bucket.mybucke
  to   = aws_s3_bucket.mybucket
}
*/