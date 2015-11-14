# Setting Up phpMyAdmin on Amazon Linux AMI

----


## Installing phpMyAdmin

On Amazon Linux AMI Installs...

``` sudo yum --enablerepo=epel install phpmyadmin ```


## Chmod & Edit phpMyAdmin Config File

``` sudo chmod 0700 /etc/httpd/conf.d/phpMyAdmin.conf ```

``` sudo pico /etc/httpd/conf.d/phpMyAdmin.conf ```

Comment out the two lines:

``` Alias /phpMyAdmin /usr/share/phpMyAdmin ```
``` Alias /phpmyadmin /usr/share/phpMyAdmin ```

Add # before each line to comment them out

``` #Alias /phpMyAdmin /usr/share/phpMyAdmin ```
``` #Alias /phpmyadmin /usr/share/phpMyAdmin ```


## Restart Apache

``` service httpd restart ```

or

``` sudo httpd -k restart ```


## Create Symbolic Link to phpMyAdmin

``` ln -s /usr/share/phpMyAdmin /usr/var/html/pma ```

or

``` ln -s /usr/share/phpMyAdmin /usr/var/html/DOMAIN.COM/pma ```


## Access phpMyAdmin

Open a browser to http://your-doman.com/pma
