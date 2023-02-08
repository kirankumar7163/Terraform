



terraform {
  backend "s3" {
    bucket = "kiranprav"
    key    = "path/to/my/key"
    region = "us-east-1"
  }
}
