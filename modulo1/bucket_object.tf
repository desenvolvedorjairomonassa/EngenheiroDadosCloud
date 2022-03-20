resource "aws_s3_bucket_object" "object" {
  bucket = aws_s3_bucket.modulo1.bucket
  key    = "783405ad55a312769ee5094312fb3a09"
  source = "C:/Users/014207631/Downloads/microdados_enem_2020/DADOS/MICRODADOS_ENEM_2020.csv"

}


# resource "aws_s3_bucket_object" "rais-2020" {
#   bucket = aws_s3_bucket.modulo1.bucket
#   key    = "da266364a1df8404564e66581425482d"
#   source = "C:/Users/014207631/Documents/microdados_vinculos/microdados_vinculos.csv"

# }