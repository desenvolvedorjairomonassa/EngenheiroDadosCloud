#criando o bucket
resource "aws_s3_bucket" "modulo1" {
  bucket = "modulo1-11be0fb9b134642f8bfc165a5194c3d5"
  # acl    = "private"

  tags = {
    Name        = "My bucket-modul1"
    Environment = "Dev"
    Manageby    = "Terraform"
  }
}

resource "aws_s3_bucket_acl" "modulo1-acl" {
  bucket = aws_s3_bucket.modulo1.id
  acl    = "private"
}

