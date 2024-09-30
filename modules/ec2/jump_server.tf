data "aws_ami" "ubuntu_2204" {
  most_recent      = true
  name_regex       = "^ubuntu-2204"

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
}

resource "aws_instance" "jump_server" {
  ami           = data.aws_ami.ubuntu_2204.id
  instance_type = var.instance_type
  subnet_id = var.bastian_subnet_id
  key_name = aws_key_pair.jump_server_key.id
  vpc_security_group_ids = [var.allow_ssh_security_group_id]
  iam_instance_profile = aws_iam_instance_profile.jump_server_profile.name

  user_data = <<-EOL
  #!/usr/bin/bash
  echo "Download kubectl from s3"
  curl -O https://s3.us-west-2.amazonaws.com/amazon-eks/1.28.3/2023-11-14/bin/linux/amd64/kubectl
  mkdir -p $HOME/bin && cp ./kubectl $HOME/bin/kubectl && chmod +x $HOME/bin/kubectl && export PATH=$HOME/bin:$PATH
  echo 'export PATH=$HOME/bin:$PATH' >> ~/.bashrc
  echo "Print kubectl version"
  kubectl version --client
  aws sts get-caller-identity
  aws eks update-kubeconfig --region ${var.region} --name ${var.eks_cluster_name}
  sleep 10
  KUBECONFIG=/root/.kube/config kubectl config view

  echo 'Install Helm'
  curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
  chmod 700 get_helm.sh
  ./get_helm.sh

  echo 'check user'
  id
  helm repo add eks https://aws.github.io/eks-charts
  KUBECONFIG=/root/.kube/config helm install aws-load-balancer-controller eks/aws-load-balancer-controller -n kube-system --set clusterName=${var.eks_cluster_name} --set vpcId=${var.vpc_id} --set region=${var.region}
  EOL

  tags = {
    Name = var.jump_server_name
  }
}

resource "aws_eip" "jump_server" {
  instance = aws_instance.jump_server.id
}

resource "aws_key_pair" "jump_server_key" {
  key_name   = "jump-server-key"
  public_key = var.jump_server_public_key
}