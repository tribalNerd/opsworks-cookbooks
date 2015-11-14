# WP-CLI on Amazon EC2 Instance

WP-CLI is a command-line tool for WordPress.

* [WP-CLI](http://wp-cli.org/)
* [WP-CLI Commands](http://wp-cli.org/commands/)

----

## Download WP-CLI to EC2 Instance /var/www/html

``` sudo su ```

``` curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar ```

``` chmod -x wp-cli.phar ```


### Ensure that WP-CLI Works

``` php wp-cli.phar --info ```


## Run WP-CLI as a different user than root

``` su -s /bin/bash apache ```

### Exit Bash

``` exit ```


## Install Wordpress

``` php wp-cli.phar core install --url="DOMAIN.COM"  --title="WEBSITE TITLE" --admin_user="USERNAME" --admin_password="PASSWORD" --admin_email="EMAIL@EMAIL.COM" ```


## Update Wordpress Core

``` php wp-cli.phar core update ```

``` php wp-cli.phar core update-db ```


## Log into MySQL

``` php wp-cli.phar db cli ```


## Manage MySQL without logging in

Note: The table prefix in the example is wp_

``` php wp-cli.phar db query "SELECT * FROM wp_users;" ```


## Update Plugins & Themes

``` php wp-cli.phar plugin update --all ```

``` php wp-cli.phar theme update --all ```

