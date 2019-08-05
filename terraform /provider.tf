# Configure credential AWS Provider

# Will use creds in ~/.aws 
provider "aws" {
  region                  = "${var.aws_region}"
  shared_credentials_file = "$HOME/.aws/credentials"
  profile                 = "default"
}

# #Can hard code creds below
# provider "aws" {
#   region     = "${var.aws_region}"
#   access_key = "access_key"
#   secret_key = "secret_key"
# }