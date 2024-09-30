resource "aws_iam_instance_profile" "jump_server_profile" {
  name = "jump_server_profile"
  role = var.jump_server_role_name
}