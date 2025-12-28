provider "aws" {
    region = "us-south-1"  
}

resource "aws_instance" "foo" {
  ami           = "ami-02b8269d5e85954ef" # us-west-2
  instance_type = "t3.micro"
  tags = {
      Name = "TF-Instance"
  }
}
