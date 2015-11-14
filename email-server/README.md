# Setting Up an Email Server on Amazon Linux AMI EC2 Instance

----

## Setup Database

``` mysql -u root -p ```

``` CREATE DATABASE `emaildb`; ```

``` GRANT SELECT,INSERT,UPDATE,DELETE,CREATE,DROP ON EMAIL-DB-USER.* TO 'EMAIL-DB-USER'@'localhost' IDENTIFIED by 'EMAIL-DB-PASSWORD'; ```

``` GRANT SELECT,INSERT,UPDATE,DELETE,CREATE,DROP ON EMAIL-DB-USER.* TO 'EMAIL-DB-USER'@'%' IDENTIFIED by 'EMAIL-DB-PASSWORD'; ```

``` exit ```

``` mysql -u EMAIL-DB-USER -p EMAIL-DB-NAME ```

Create 3 DB Tables: aliases, domains & users

``` CREATE TABLE `aliases` (
`pkid` smallint(3) NOT NULL auto_increment,
`mail` varchar(120) NOT NULL default '',
`destination` varchar(120) NOT NULL default '',
`enabled` tinyint(1) NOT NULL default '1',
PRIMARY KEY  (`pkid`),
UNIQUE KEY `mail` (`mail`)
); ```

``` CREATE TABLE `domains` (
`pkid` smallint(6) NOT NULL auto_increment,
`domain` varchar(120) NOT NULL default '',
`transport` varchar(120) NOT NULL default 'virtual:',
`enabled` tinyint(1) NOT NULL default '1',
PRIMARY KEY  (`pkid`)
); ```

``` CREATE TABLE `users` (
`id` varchar(128) NOT NULL default '',
`name` varchar(128) NOT NULL default '',
`uid` smallint(5) unsigned NOT NULL default '5000',
`gid` smallint(5) unsigned NOT NULL default '5000',
`home` varchar(255) NOT NULL default '/var/spool/mail/virtual',
`maildir` varchar(255) NOT NULL default 'blah/',
`enabled` tinyint(1) NOT NULL default '1',
`change_password` tinyint(1) NOT NULL default '1',
`clear` varchar(128) NOT NULL default 'ChangeMe',
`crypt` varchar(128) NOT NULL default 'sdtrusfX0Jj66',
`quota` varchar(255) NOT NULL default '',
PRIMARY KEY  (`id`),
UNIQUE KEY `id` (`id`)
); ```

View the nccaaewly created tables

``` describe aliases; describe domains; describe users; ```


### Install Postfix

``` sudo yum install postfix postfix-mysql ```

### Configure Postfix

