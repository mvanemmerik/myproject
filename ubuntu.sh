#! /bin/bash
sudo apt-get update
sudo apt-get install -y nginx
sudo systemctl start nginx
sudo systemctl enable nginx
content=$(curl -L https://mvanemmerik.com)
echo $content | sudo tee /var/www/html/index.html
