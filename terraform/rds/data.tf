data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "ci-cd-demo-backend-abdulaziz-19"
    key    = "path/to/my/vpc"
    region = "us-east-2"

  }
}
