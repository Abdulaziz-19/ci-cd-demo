data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["golden-image*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["self"] 
}
module "asg" {
  source  = "terraform-aws-modules/autoscaling/aws"
  # Autoscaling group
  name = "example-asg"
  min_size                  = 0
  max_size                  = 1
  desired_capacity          = 1
  wait_for_capacity_timeout = 0
  health_check_type         = "EC2"
  vpc_zone_identifier       = data.terraform_remote_state.vpc.outputs.public_subnets

  # Launch template
  launch_template_name        = "example-asg"
  launch_template_description = "Launch template example"
  update_default_version      = true

  image_id          = data.aws_ami.ubuntu.id
  instance_type     = "t3.micro"
  ebs_optimized     = true
  enable_monitoring = true

}



