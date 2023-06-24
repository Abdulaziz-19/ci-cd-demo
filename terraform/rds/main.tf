resource "aws_db_subnet_group" "ci-cd" {
  name       = "ci-cd-demo"
  subnet_ids = data.terraform_remote_state.vpc.outputs.private_subnets
}