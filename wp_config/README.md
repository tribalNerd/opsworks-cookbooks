# AWS OpsWorks Cookbook :: Wordpress Configuration

Deploy & Setup wp_config.php

----

## Custom JSON

```{
  "wp_config" : {
    "owner" : "root",
    "wp_debug" : false,
    "wp_debug_log" : false,
    "wp_debug_display" : false,
    "display_errors" : false,
    "wp_path" : "/var/www/html",
    "wp_lang" : "",
    "db_prfx" : "wp_",
    "db_name" : "",
    "db_user" : "",
    "db_pass" : "",
    "db_host" : "",
    "db_charset" : "utf8",
    "db_collate" : "",
    "wp_cache" : true,
    "wp_auto_repair" : false,
    "wp_memory_limit" : true,
    "set_memory_limit" : "256M",
    "disable_wp_cron" : false,
    "disable_file_edit" : true,
    "force_ssl_login" : false,
    "setup_multisite" : false,
    "network_enabled" : false,
    "mutlsite_path" : "/",
    "mutlsite_domain" : "",
    "aws_keys" : false,
    "aws_access_key" : "",
    "aws_secrets_key" : "",
    "ms_lockdown" : false,
    "mslock_down_key" : "",
    "auth_key" : "",
    "secure_auth_key" : "",
    "logged_in_key" : "",
    "nonce_key" : "",
    "auth_salt" : "",
    "secure_auth_salt" : "",
    "logged_in_salt" : "",
    "nonce_salt" : ""
  }
}```

## Stack-Layers Use

Ops Work Admin > Layers > Recipes > Edit
Custom Chef Recipes > Deploy: wp_config::default

## Manual Use

Ops Work Admin > Stack > Run Command
Settings > Command > Execute Recipes
Recipes to execute: wp_config::default

----

* [OpsWorks Cookbooks Home](https://github.com/tribalNerd/aws-opsworks-cookbooks/)

----
----

### Apache 2.0 License

Unless otherwise stated, cookbooks/recipes are licensed under the [Apache 2.0 license](http://aws.amazon.com/apache-2-0/).