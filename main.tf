variable "users" {
  default = {
    Andrei : { country : "Madeira", department : "AWS" },
    Tom : { country : "US", department : "ABC" },
    Nicoleta : { country : "Germany", department : "DCE" }
  }
}
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
  # VERSION IS NOT NEEDED HERE
}

resource "aws_iam_user" "my_iam_users" {
  for_each = var.users
  name     = each.key
  tags = {
    country : each.value.country
    department : each.value.department
  }


}

