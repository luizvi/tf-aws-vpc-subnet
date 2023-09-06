#!/bin/bash
############

yum update -y && yum upgrade -y
yum install httpd -y

systemctl start httpd
systemctl enable httpd

echo "Luiz Vinícius - luiz.andrade@orsegups.com.br" >> /var/www/html/index.html