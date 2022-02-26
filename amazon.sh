#! /bin/bash
sudo yum install nginx -y
sudo service nginx start
content=$(curl -L https://mvanemmerik.com)
echo $content | sudo tee /usr/share/nginx/html/index.html