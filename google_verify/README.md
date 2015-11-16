# AWS OpsWorks Cookbook :: Create Google Verify Files

Create Google Verify Files: google#############.html

----

## Custom JSON

```{
  "google_verify" : [ "google2380b6297fa6bdc8", "google195979255185acb6"]
}```

## Stack-Layers Use

Ops Work Admin > Layers > Recipes > Edit
Custom Chef Recipes > Configure: google_verify::default

## Manual Use

Ops Work Admin > Stack > Run Command
Settings > Command > Execute Recipes
Recipes to execute: google_verify::default

----

* [OpsWorks Cookbooks Home](https://github.com/tribalNerd/aws-opsworks-cookbooks/)

----
----

### Apache 2.0 License

Unless otherwise stated, cookbooks/recipes are licensed under the [Apache 2.0 license](http://aws.amazon.com/apache-2-0/).