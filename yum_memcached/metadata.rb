name             "yum_memcached"
description      "Install & Start Memcached"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.rdoc'))
maintainer       "AWS OpsWorks"
license          "Apache 2.0"
version          "1.0.0"

recipe "yum_memcached::default", "Install & Start Memcached"