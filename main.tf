provider "aws" {

     access_key = "${var.aws_access_key}"
     secret_key = "${var.aws_secret_key}"
     region = "ap-south-1"

}
module "cloudwatch" {
    source = "./module"
 
  
}
  
module "ec2" {
    source = "./module/ec2"

  
}
module "vpc" {
    source = "./module/vpc"
  
} 