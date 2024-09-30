data "aws_iam_policy_document" "eks_role_policy_document" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["eks.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "eks_role" {
  name               = "eks-cluster-role"
  assume_role_policy = data.aws_iam_policy_document.eks_role_policy_document.json
}

resource "aws_iam_role_policy_attachment" "production-eks-AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.eks_role.name
}

resource "aws_iam_role_policy_attachment" "production-eks-AmazonEKSVPCResourceController" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
  role       = aws_iam_role.eks_role.name
}

resource "aws_iam_role" "eks-node-group-role" {
  name = "eks-node-group-role"

  assume_role_policy = jsonencode({
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
    Version = "2012-10-17"
  })
}

resource "aws_iam_role_policy_attachment" "example-AmazonEKSWorkerNodePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.eks-node-group-role.name
}

resource "aws_iam_role_policy_attachment" "example-AmazonEKS_CNI_Policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.eks-node-group-role.name
}

resource "aws_iam_role_policy_attachment" "example-AmazonEC2ContainerRegistryReadOnly" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.eks-node-group-role.name
}

### eks pod identity association role - s3 access ###
data "aws_iam_policy_document" "aws_eks_pod_identity_association_policy_document" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["pods.eks.amazonaws.com"]
    }

    actions = [
      "sts:AssumeRole",
      "sts:TagSession"
    ]
  }
}

resource "aws_iam_role" "eks_pod_identity_role" {
  name               = "eks-pod-identity-role"
  assume_role_policy = data.aws_iam_policy_document.aws_eks_pod_identity_association_policy_document.json
}

resource "aws_iam_role_policy_attachment" "s3_full_access" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
  role       = aws_iam_role.eks_pod_identity_role.name
}

### eks pod identity association role - eks alb controller ###
resource "aws_iam_role" "eks_pod_identity_role_elb_controller" {
  name               = "eks-pod-identity-role-elb-controller"
  assume_role_policy = data.aws_iam_policy_document.aws_eks_pod_identity_association_policy_document.json
}

resource "aws_iam_policy" "eks_alb_controller_policy" {
  name        = "eks_alb_controller_policy"
  description = "Access required for EKS ALB controller"

  policy = file("./modules/iam/eka_alb_iam_policy.json")
}

resource "aws_iam_role_policy_attachment" "example_attachment" {
  role       = aws_iam_role.eks_pod_identity_role_elb_controller.name
  policy_arn = aws_iam_policy.eks_alb_controller_policy.arn
}

### Jump server role ###
resource "aws_iam_role" "jump_server_role" {
  name = "jump-server-eks-full-access"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy" "eksfullaccess_policy" {
  name = "EksFullAccess_policy"
  role = aws_iam_role.jump_server_role.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "eks:*",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}
