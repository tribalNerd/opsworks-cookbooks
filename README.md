# AWS OpsWorks Cookbooks for Wordpress Installs

Custom OpsWorks Cookbooks for Multisite Network Wordpress Installs. The "Apps" loaded onto the PHP App Server is Wordress, with plugins and themes

The "App" for the OpsWorks setup is Wordpress, stored in a Private Repo. The Repo contains all Wordpress working files, themes and plugins for the project. A .gitignore file excludes the wp-config.php file, /wp-content/cache/config and /wp-content/uploads/sites.

## Stack

The Stack that holds the PHP App Server must be configured to work with a Repository that contains only cookbooks.

Stack > Stack Settings > Edit : Configuration Management

## Layer: PHP App Server
### Custom Chef Recipes

Layers > PHP APP Server : Recipes > Edit

*Configure:* ``` virtualhost::default ``` ``` pico::default ``` ``` swapfile::default ```

*Deploy:* ``` wp_config::default ``` ``` verify_site::default ``` ``` wp_owner::default ```


## Layers JSON Node Data

* Create a layers.json file on your local dev and populate the fields.
* Add layers.json to your .gitignore file

Layers > PHP APP Server : Settings > Edit : Custom JSON

```json
{
    "apache" : {
        "prefork" : {
            "startservers" : 32,
            "minspareservers" : 32,
            "maxspareservers" : 64
        }
    },
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
        "wp_memory_limit" : false,
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