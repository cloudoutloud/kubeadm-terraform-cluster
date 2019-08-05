#terraform state file setup
#create an S3 bucket to store the state file in
resource "aws_s3_bucket" "terraform-state" {
    bucket = "terraform-state-storage-s3-kubeadm"
 
    versioning {
      enabled = true
    }
}

terraform {
  backend "s3" {
    bucket = "terraform-state-storage-s3-kubeadm"
    key    = "terraform-state/terraform.tfstate"
    region = "eu-west-2"
  }
}