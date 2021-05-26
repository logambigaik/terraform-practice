#Note once you run the script, stop the newly created instance and edit the userdata and then restart it again
# Now check the http://100.26.35.95/phpinfo.php

provider "aws" {
   region = "us-east-1"
   access_key = "A*************"
   secret_key = "7*************"
}

#resource "aws_key_pair" "terraform_demo" {
#   key_name= "Archu-acc"
#   public_key= "${file("Archu-acc.pem")}"
#}

resource "aws_instance" "my_instance" {
   ami = "ami-0d5eff06f840b45e9"
   instance_type= "t2.micro"
   key_name = "Archu-acc"
   user_data = <<EOF
                 #! /bin/sh
                 yum update -y
                 amazon-linux-extras install -y lamp-mariadb10.2-php7.2 php7.2
                 yum install -y httpd mariadb-server
                 systemctl start httpd
                 systemctl enable httpd
                 usermod -a -G apache ec2-user
                 chown -R ec2-user:apache /var/www
                 chmod 2775 /var/www
                 find /var/www -type d -exec chmod 2775 {} \;
                 find /var/www -type f -exec chmod 0664 {} \;
                 echo "<?php phpinfo(); ?>" > /var/www/html/phpinfo.php
  EOF

   tags = {
            Name= "Terraform"
         }
}
