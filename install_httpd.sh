#! /bin/bash
sudo yum install httpd -y
sudo service httpd start
content=$(curl -L https://mvanemmerik.com)
echo $content | sudo tee /var/www/html/index.html