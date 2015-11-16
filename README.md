# AWS OpsWorks Cookbooks for Wordpress Installs


## Layer PHP App Server
### Custom Chef Recipes

*Configure:* ``` virtualhost::default ``` ``` pico::default ``` ``` swapfile::default ```

*Deploy:* ``` wp_config::default ``` ``` verify_site::default ``` ``` wp_owner::default ```

## Stack JSON Node Data

* Create a stacks.json on your local dev to store the settings in.
* Add stacks.json to your .gitignore file

```json
{
    "apache" : {
      "timeout" : 40,
      "keepaliverequests" : 200,
      "keepalivetimeout" : 2
    }
}
```


## Layers JSON Node Data

* Create a layers.json file on your local dev and populate the fields.
* Add layers.json to your .gitignore file

```json
{
    "app_root" : "/srv/www/html/current",
    "httpd_home" : "/etc/httpd/conf.d",
    "deploy": {
        "wordpress": {
          "application": "wordpress",
          "application_type": "php",
          "deploy_to": "/srv/www/html"
        }
    },
    "virutalhost": {
        "domain1.com": {
          "port": "80",
          "path": "/srv/www/html/current",
          "email": "hostmaster@domain1.com"
        },
        "domain2.com": {
          "port": "80",
          "path": "/srv/www/html/current",
          "email": "hostmaster@domain2.com"
        }
    },
    "wp_install" : {
        "owner" : "apache",
        "latest" : "http://wordpress.org/latest.tar.gz"
    },
    "verify_site" : [ "google#############", "google#############"],
    "wp_config" : {
        "owner" : "root",
        "wp_debug" : false,
        "wp_debug_log" : false,
        "wp_debug_display" : false,
        "display_errors" : false,
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
        "nonce_salt" : "",
    }
}
```

----

* [OpsWorks Cookbooks Home](https://github.com/tribalNerd/aws-opsworks-cookbooks/)

----
----

### Apache 2.0 License

Unless otherwise stated, cookbooks/recipes are licensed under the [Apache 2.0 license](http://aws.amazon.com/apache-2-0/).