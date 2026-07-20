# ======================================
# Terraform HCL Semantic Preview
# Terraform 1.x
# ======================================


# ---------- Provider ----------

terraform {

  required_version = ">= 1.6"

}


provider "aws" {

  region = "us-east-1"

}



# ---------- Variables ----------

variable "app_name" {

  type = string

  default = "AgentOS"

}



variable "instance_count" {

  type = number

  default = 2

}



# ---------- Local Values ----------

locals {

  environment = "production"

  service_name = "${var.app_name}-api"

}



# ---------- Resource ----------

resource "aws_instance" "server" {


  count = var.instance_count


  ami = "ami-123456"


  instance_type = "t3.micro"



  tags = {


    Name = local.service_name

    Environment = local.environment


  }

}



# ---------- Data Source ----------

data "aws_region" "current" {}



# ---------- Output ----------

output "server_ids" {


  value = aws_instance.server[*].id


}



# ---------- Module ----------

module "network" {


  source = "./modules/network"


  name = var.app_name


}



# ---------- Function Style Expression ----------

locals {


  ports = [

    80,

    443,

    8080

  ]


}



# ---------- Conditional Expression ----------

locals {


  instance_type = var.instance_count > 1 ?

    "t3.large" :

    "t3.micro"


}



# ---------- Dynamic Block Example ----------

resource "aws_security_group" "web" {


  name = "web-security"



  dynamic "ingress" {


    for_each = local.ports



    content {


      from_port = ingress.value

      to_port = ingress.value

      protocol = "tcp"


    }


  }


}