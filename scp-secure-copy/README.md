# Using The Secure Copy Command | scp

* How to upload content from your local machine to an AWS EC2 Instance.
* How to download content from an AWS EC2 Instance to your local machine.

----

## Upload Content to an AWS EC2 Instance

* How to upload content from your local machine to an AWS EC2 Instance.

Upload a Directory:

scp -i "/home/USERNAME/.ssh/AWS-KEY-NAME.pem" -rp /var/www/html/DOMAIN.com/wp-content/mu-plugins ec2-user@52.7.183.149:/var/www/html/DOMAIN.com/wp-content

Upload a File:

scp -i "/home/USERNAME/.ssh/AWS-KEY-NAME.pem" -rp /var/www/html/DOMAIN.com/wp-config.php ec2-user@52.7.183.149:/var/www/html/DOMAIN.com/

## Correct File Ownership on AWS EC2 Instance

sudo chown -R ec2-user:www /var/www/html/DOMAIN.com/DIRECTORY

## Download Content from an AWS EC2 Instance

How to download content from an AWS EC2 Instance to your local machine.

Download a Directory:

``` scp -i "/home/USERNAME/.ssh/AWS-KEY-NAME.pem" -rp ec2-user@PUBLIC-IP-ADDRESS:/var/www/html/DOMAIN.com/wp-content/themes/ /var/www/html/DOMAIN.com/wp-content/themes ```

Download a File:

``` scp -i "/home/USERNAME/.ssh/AWS-KEY-NAME.pem" -rp ec2-user@PUBLIC-IP-ADDRESS:/var/www/html/DOMAIN.com/wp-config.php /var/www/html/DOMAIN.com/ ```

## Correct File Ownership your Local Machine

sudo chown -R www-data:www-data /var/www/html/DOMAIN.com/DIRECTORY