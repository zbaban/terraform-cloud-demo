 variable "ec2_name" {
   type = map 
   default = ["dev-ec2","stage-ec2","prod-ec2"]
 }

 
resource "aws_spot_instance_request" "cheap_worker" {
    ami = "ami-09246ddb00c7c4fef"
    instance_type = var.ec2_type
    spot_price = "0.0016"
    spot_type = "one-time"
    count = 3
    tags = {
    Name = var.ec2_name[2]
    }
}
