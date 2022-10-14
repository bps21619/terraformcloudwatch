resource "aws_instance" "monitor_instance" {
    instance_type = "t2.micro"
    ami = "ami-062df10d14676e201"
    key_name = "yahoo_ac_mumbai.pem"
    monitoring = true
    tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}