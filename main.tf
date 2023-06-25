provider "aws" {
  region     = "eu-north-1"
}

resource "aws_instance" "my_ec2_instance" { 
 ami = "ami-0989fb15ce71ba39e" 
 instance_type = "t3.medium" 
 key_name = "devopslabs" 
  
 tags ={ 
 name="production server" 
} 
 user_data  = <<-EOF
 #!/bin/bash
     sudo apt-get update -y
     sudo apt install docker.io -y
     sudo systemctl enable docker
     sudo docker run -itd -p 8084:8081 alishataj/banking
     sudo docker start $(docker ps -aq)
EOF
}
