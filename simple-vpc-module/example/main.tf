provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source = "../"
  vpc_parameters = {
    vpc1 = {
      cidr_block = "10.0.0.0/16"
    }
  }
  igw_parameters = {
    igw1 = {
      vpc_name = "vpc1"
    }
  }
  rt_parameters = {
    rt1 = {
      vpc_name = "vpc1"
      routes = [{
        cidr_block = "0.0.0.0/0"
        gateway_id = "igw1"
        }
      ]
    }
  }
}
