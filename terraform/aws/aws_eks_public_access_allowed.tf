resource "aws_eks_cluster" "allowed" {
  vpc_config {
    endpoint_public_access = false
  }
}

resource "aws_eks_cluster" "allowed_2" {
  vpc_config {
    public_access_cidrs = ["192.168.1.0/24"]
  }
}

resource "aws_eks_cluster" "allowed_3" {
  vpc_config {
    endpoint_public_access = true
    public_access_cidrs = ["192.168.1.0/24"]
  }
}


