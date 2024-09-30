# VPC

region = "ap-southeast-1"
az1 = "ap-southeast-1a"
az2 = "ap-southeast-1b"

vpc_name = "production_vpc"

production_nat_gateway_name = "production_nat_gateway"

eks_cidr = "172.10.11.0/24"
eks_subnet_1_name = "eks_subnet_1"
eks_subnet_1 = "172.10.11.0/25"
eks_subnet_2_name = "eks_subnet_2"
eks_subnet_2 = "172.10.11.128/25"

eks_node_group_cidr = "172.10.12.0/24"
eks_node_group_subnet_1_name = "eks_node_group_subnet_1"
eks_node_group_subnet_1 = "172.10.12.0/25"
eks_node_group_subnet_2_name = "eks_node_group_subnet_2"
eks_node_group_subnet_2 = "172.10.12.128/25"

production_public_CIDR = "172.10.20.0/24"
production_public_subnet_1_name = "production_public_subnet_1"
production_public_subnet_1 = "172.10.20.0/25"
production_public_subnet_2_name = "production_public_subnet_2"
production_public_subnet_2 = "172.10.20.128/25"

# EKS Cluster
eks_cluster_name = "production-eks-cluster"
eks_node_instance_type = "t3.small"

# Jump Server
jump_server_name = "production-jump-server"
instance_type = "t3.micro"
jump_server_public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCx++8/r8L5JMwqghQa5QR2h9PWdcbO0bRi1WvJzsKYGojTzxPGGqQTiibw+vq0600fJd23dhPhcNGI1+9oLGVgVMYjKB8W+3/SOpmTPt/IKyBLG3TwsXW98dvUAjJDs+zpWUfbeIFTWK2fCcxPcgjo9p5ufcSN6Kne3u7/pr8cpcwM1Tl17UsSqhPe/Pkt6FVAK+z9kcX0wewMELbo+7lcutHPmmdqiBvocHDj7h/E2QynHtHA5DvnWRaxVtuXw5jZVcH+QrbtgKgW5fro0eZvcdOaZ3e4u+B8EYQAXNZVm9qmIDTfwQ32uqSNLmiZuFaITou0f1trU6HYe1N0PLHEmqc4ss/L0bD7VpWHjgCh2q7QpGnoyKS3aJDRfDhegxhAQ5W9prZD4cnO8Cz/+5YQ3Vb0uG2qImF4bEywuyXMiwKZuXpvm3wenI0odU35GCkqTYKAj66TkYU3fDwtYi/I7db/VnIqTN6bIUGFH+5r5BRaTgtQa6Jb5Vg2Zaczz5k= amith@test"
