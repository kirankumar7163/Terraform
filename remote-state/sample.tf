



terraform {
  backend "s3" {
    bucket = "awsctrkiran"
    key    = "path/to/my/key"
    region = "us-east-1"
  }
}
