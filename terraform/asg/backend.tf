terraform {
  backend "s3" {
    bucket = "ci-cd-demo-backend-abdulaziz-19"
    key    = "path/to/my/asg"
    region = "us-east-2"
  }
}