# Security group configuration
resource "aws_security_group" "kube-sg" {
  name          = "kube-sg"
  description   = "Allow default administration for cluster"
  vpc_id        = "${aws_vpc.kube-network.id}"
  tags          = {
    Name        = "kube-sg"
  }

  # Inbound ssh access
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Inbound kube port access
  ingress {
    from_port   = 6443
    to_port     = 6443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Outbound all
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
