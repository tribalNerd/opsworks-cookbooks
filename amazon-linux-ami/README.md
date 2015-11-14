# Setting Up an Amazon Linux AMI EC2 Instance

----

## Log into Instance

``` ssh -i ".ssh/KEY-NAME.pem" ec2-user@PUBLIC-IP-ADDRESS ```


## Make Pico Work (for me)

``` cd /usr/bin ```

``` sudo ln -s nano pico ```

``` export EDITOR="pico" ```


Sourced From: http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/install-LAMP.html


## Update Yum

``` sudo yum update ```


## Install Apache, MySQL & PHP

``` sudo yum install -y httpd24 php56 mysql55-server php56-mysqlnd ```


## Start Apache

``` sudo service httpd start ```

## Check that Apache has Started

``` chkconfig --list httpd ```


## Set Apache to restart on boot

``` sudo chkconfig httpd on ```


## Create the www group & add the ec2-user to the www group

``` sudo groupadd www ```

``` sudo usermod -a -G www ec2-user ```


## Exit & Log Back In

``` exit ```


## Set ownership & permissions of web root

``` sudo chown -R root:www /var/www ```

``` sudo usermod -a -G www apache ```

``` sudo chown -R apache /var/www ```

``` sudo chgrp -R www /var/www ```

``` sudo chmod 2775 /var/www ```


## Set ownership & permissions for future sub-directories

``` find /var/www -type d -exec sudo chmod 2775 {} + ```

``` find /var/www -type f -exec sudo chmod 0664 {} + ```

## Restart Apache

``` sudo service httpd restart ```


## Verify PHP is working

Creates a PHP file, with the phpinfo() function added

``` echo "<?php phpinfo(); ?>" > /var/www/html/phpinfo.php ```

Open in your web browser

``` http://ec2-instance-url.com ```

Remove PHP File

``` rm /var/www/html/phpinfo.php ```


## Start MySQL

``` sudo service mysqld start ```


## Secure MySQL

``` sudo mysql_secure_installation ```

Set the MySQL root password if not set. Press Y for the remaining questions.


### Set MySQL to start on boot

``` sudo service mysqld stop ```

``` sudo chkconfig mysqld on ```

``` sudo service mysqld start ```


### Setup MySQL Database

``` mysql -u root -p ```


### Setup Aapache

``` sudo pico /etc/httpd/conf/httpd.conf ```

Within the section ``` <Directory "/var/www/html"> ``` modify the AllowOverride None

``` AllowOverride All ```

``` sudo pico /etc/httpd/conf.d/YOUR-DOMAIN-NAME.com.conf

``` <VirtualHost *:80>
ServerAdmin webmaster@YOUR-DOMAIN-NAME.com
DocumentRoot "/var/www/html/YOUR-DOMAIN-NAME.com"
ServerName YOUR-DOMAIN-NAME.com
</VirtualHost> ```

``` sudo httpd -k restart ```




### Install Wordpress

Sourced From: http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/hosting-wordpress.html

``` cd /var/www/html ```

``` wget https://wordpress.org/latest.tar.gz ```

``` tar -xzf latest.tar.gz ```

``` rm latest.tar.gz ```

``` mv /var/www/html/wordpress/* /var/www/html/ ```

``` rm -rf wordpress ```

``` rm readme.txt ```

``` rm license.txt ```

``` mv wp-config-sample.php wp-config.php ```

Access the website & setup Wordpress, once you have the .htaccess rules

``` pico .htaccess ```

### Create Wordpress Database

``` mysql -u root -p ```

``` CREATE USER 'WORDPRESS-DB-USER'@'localhost' IDENTIFIED BY 'STRONG-DB-PASSWORD'; ```

``` CREATE DATABASE `WORDPRESS-DB-NAME`; ```

``` GRANT ALL PRIVILEGES ON `WORDPRESS-DB-NAME`.* TO "WORDPRESS-DB-USER"@"localhost"; ```

``` FLUSH PRIVILEGES; ```

Type ``` exit ``` to leave the MySQL client


### Build the Wp-Config.php

``` sudo pico /var/www/html/wp-config.php ```

``` define('DB_NAME', 'wordpress-db');
define('DB_USER', 'wordpress-user');
define('DB_PASSWORD', 'your_strong_password'); ```

``` $table_prefix  = 'Something###_'; ```

``` https://api.wordpress.org/secret-key/1.1/salt/ ```

``` define('WP_DEBUG', false);
//define('WP_DEBUG_LOG', true);
//define('WP_DEBUG_DISPLAY', false);
//@ini_set('display_errors',0); ```


### Update .htaccess

All rules go above the Wordpress rules / below plugin cache rules

Required for ht-authentication on Wp-Login.php

``` Options -Indexes
RewriteRule .? - [E=HTTP_AUTHORIZATION:%{HTTP:Authorization}] ```


Custom Cache Rules

``` <IfModule mod_expires.c>
ExpiresActive On
ExpiresByType image/jpg "access 7 days"
ExpiresByType image/jpeg "access 7 days"
ExpiresByType image/gif "access 7 days"
ExpiresByType image/png "access 7 days"
ExpiresByType text/css "access 1 day"
ExpiresByType application/pdf "access 1 year"
ExpiresByType text/x-javascript "access 7 days"
ExpiresByType application/x-shockwave-flash "access 1 year"
ExpiresByType image/x-icon "access 1 year"
ExpiresDefault "access 7 days"
</IfModule> ```


Move old uploaded images to new location

``` RewriteRule ^([_0-9a-zA-Z-]+/)?files/(.+) wp-includes/ms-files.php?file=$2 [L] ```

Custom Access Messages

``` RewriteRule ^(wp-admin)($|/) - [L]
RewriteCond %{HTTP_HOST} ^DOMAIN.com$
RewriteCond %{REQUEST_URI} ^.*/files/.*
RewriteCond %{HTTP_COOKIE} !^.*eMember_in_use.*$ [NC]
RewriteRule . /symmetry/access.html?loc=%{REQUEST_URI} [R,L] ```
