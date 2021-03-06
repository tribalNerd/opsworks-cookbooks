# AWS OpsWorks Cookbook :: Installing Wordpress

Downloads & extracts Wordpress sets up the wp-config.php file.
Removes wp-config-sample.php, readme.html and license.txt.

----

## Custom JSON

```{
  "google" : {
    "owner" : "apache",
    "path" : "/var/www/html",
    "latest" : "http://wordpress.org/latest.tar.gz"
  }
}```

## Stack-Layers Use

Ops Work Admin > Layers > Recipes > Edit
Custom Chef Recipes > Deploy: wordpress::default

## Manual Use

Ops Work Admin > Stack > Run Command
Settings > Command > Execute Recipes
Recipes to execute: wordpress::default

----

* [OpsWorks Cookbooks Home](https://github.com/tribalNerd/aws-opsworks-cookbooks/)

----
----

### Apache 2.0 License

Unless otherwise stated, cookbooks/recipes are licensed under the [Apache 2.0 license](http://aws.amazon.com/apache-2-0/).