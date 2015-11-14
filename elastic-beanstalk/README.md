# Elastic Beanstalk Setup & Deploy

AWS Elastic Beanstalk deploys web applications (Wordpress, Themes & Plugins), and EC2 Instances based on an EC2 AMI Image.

* [Elastic Beanstalk](https://aws.amazon.com/elasticbeanstalk/developer-resources/)

----

## Launch An Elastic Beanstalk Environment

You should already have a Key Pair created. If not visit the EC2 Admin > Key Pairs menu link, then click the Create Key Pair button.

Enter the Elastic Beanstalk Admin
Create a New Elastic Beanstalk Environment
Create A New Webserver
Set the Predefined Configuration to: PHP
Set the Environment type to: Load balancing, auto scaling
For source, select Upload your own. Create a zip file with a index.html that only says Hello World (not html, just text).
No need to change the Deployment Limits
Set the Environment Name, Sub-domain & Description
If this is a completely new Wordpress or Database driven Website, then select: Create an RDS DB Instance with this environment. If you already have an RDS Database Instance or don't need a database, then click Next.
Configuration Details: Most new sites will use the Instance type of: t1 .micro, otherwise you will know what you need. Select the Key Pair to use for the EC2 Instance. Enter an Email Address for environment changes.
All other settings/pages can use the default provided settings.


## Setup Instance

Once the EC2 Instance is live, configure the server: Apache, permissions, php, etc.
Open the EC2 Instance Admin > Instances. Select the new EC2 Instance. Copy the Public DNS url: ec2-###-###-###-###.compute-1.amazonaws.com
Open Terminal, SSH to the Instance: ssh -i ".ssh/KEY-PAIR-NAME.pem" ec2-user@ec2-###-###-###-###.compute-1.amazonaws.com


### Make Pico Work

I like Pico as a text editor, it's extremely simple to use.

``` cd /usr/bin ```

``` sudo ln -s nano pico ```

``` export EDITOR="pico" ```


### Install Memcached

``` sudo yum install memcached ```

``` sudo service memcached start ```

``` sudo chkconfig --level 345 memcached on ```

``` sudo yum install php55-pecl-memcache ```


### Setup Virtual Hosts File

Modify one of the Virtual Host examples below inside of a text editor on your PC.


#### For Wordpress Multisite Networks: The Document Root & Directory path for all domains will be /var/www/html (or a single root directory) for every record.

```` #
# Website Name
#
<VirtualHost *:80>
ServerAdmin hostmaster@DOMAIN-NAME.com
DocumentRoot "/var/www/html"
ServerName DOMAIN-NAME.com
  <Directory /var/www/html/>
      Options Indexes FollowSymLinks MultiViews
      AllowOverride All
      Order deny,allow
      Allow from all
  </Directory>
</VirtualHost> ```


#### For Standalone Wordpress Websites: The Document Root & Directory path for "every" domain will be unique for each record.

```` #
# Website Name
#
<VirtualHost *:80>
ServerAdmin hostmaster@DOMAIN-NAME.com
DocumentRoot "/var/www/html/DOMAIN-NAME"
ServerName DOMAIN-NAME.com
  <Directory /var/www/html/DOMAIN-NAME/>
      Options Indexes FollowSymLinks MultiViews
      AllowOverride All
      Order deny,allow
      Allow from all
  </Directory>
</VirtualHost> ```



``` sudo pico /etc/httpd/conf.d/wordpress.conf ```

Copy/Paste the modified Virtual Host information into the pico editor, thn press CTRL+X, then type Y to save.

``` sudo httpd -k restart ```


### Create AMI Image of Instance

Return to the EC2 Instance panel, and create an AMI Image of the EB Instance.

Write down/copy the AMI ID


### Update EB Configuration

Open the Elastic Beanstalk Admin, select the Environment, then click the Configuration menu item.

Edit the Instances

Update the Custom AMI ID to use the new AMI Image, then click Apply, wait for Environment to rebuild.


### Git

Assuming Git is setup for your project, make changes, and commit to Git.

``` git status ```

``` git add /path/ ```

``` git commit -m "Commit Message" ```

``` git push origin master ```


### Depoloy to Elastic Beanstalk

Deploy app based on .ebignore rules

``` sudo eb deploy ```