resource "aws_db_subnet_group" "ci-cd" {
  name       = "ci-cd-demo"
  subnet_ids = data.terraform_remote_state.vpc.outputs.private_subnets
}

resource "aws_db_instance" "default" {
  allocated_storage    = 10
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  name                 = "mydb"
  username             = "foo"
  password             = "foobarbaz"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  db_subnet_group_name = aws_db_subnet_group.ci-cd.name
}