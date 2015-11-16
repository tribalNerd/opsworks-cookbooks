# AWS OpsWorks Cookbook :: Installs PHP-MYSQL, Required By Wordpress

For Amazon AMI Instances, Installs PHP-MYSQL & PHP-PDO.

----

## Stack Use

Ops Work Admin > Layers > Recipes > Edit
Custom Chef Recipes > Configure: yum_mysql::default

## Manual Use

Ops Work Admin > Stack > Run Command
Settings > Command > Execute Recipes
Recipes to execute: yum_mysql::default

----

* [OpsWorks Cookbooks Home](https://github.com/tribalNerd/aws-opsworks-cookbooks/)

----
----

### Apache 2.0 License

Unless otherwise stated, cookbooks/recipes are licensed under the [Apache 2.0 license](http://aws.amazon.com/apache-2-0/).