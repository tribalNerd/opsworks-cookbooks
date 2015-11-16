name             "wordpress"
description      "Downloads & Expands Wordpress & Plugins If Defined, Creates Config, Corrects Permissions & Garbage Cleanup."
long_description IO.read(File.join(File.dirname(__FILE__), 'README.rdoc'))
maintainer       "tribalNerd"
license          "Apache 2.0"
version          "1.0.0"

recipe "wordpress::deploy", "Install & Configure Wordpress"