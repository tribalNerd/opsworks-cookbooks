name             "wp_config::default"
description      "Deploy & Setup wp_config.php"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.rdoc'))
maintainer       "tribalNerd"
license          "Apache 2.0"
version          "1.0.0"

recipe "yum_mysql::default", "Deploy & Setup wp_config.php"