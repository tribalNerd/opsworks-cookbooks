# AWS OpsWorks Cookbook :: Create Google Verify Files

Create Google Verify Files: google#############.html

----

## Custom JSON

```{
  "google" : {
    "file" : "google0000000000000000",
    "file" : "google0000000000000000"
  }
}```

## Stack-Layers Use

Ops Work Admin > Layers > Recipes > Edit
Custom Chef Recipes > Configure: google::default

## Manual Use

Ops Work Admin > Stack > Run Command
Settings > Command > Execute Recipes
Recipes to execute: google::default

----

* [OpsWorks Cookbooks Home](https://github.com/tribalNerd/aws-opsworks-cookbooks/)

----
----

### Apache 2.0 License

Unless otherwise stated, cookbooks/recipes are licensed under the [Apache 2.0 license](http://aws.amazon.com/apache-2-0/).