#
# Cookbook Name:: virtualhost
# Recipe:: virtualhost::default
# About:: Default Settings
#

#
# Location To Create Config Files
# Use: #{node[:vhost][:conf]}
#

default[:vhost][:conf] = "/etc/httpd/conf.d"


#
# Virtual Host Records
#
default["vhost"]["domains"]["hive.madmadder.com"]        = { "vhostname" => "hive.madmadder.com",        "vhostadmin" => "hostmaster@madmadder.com",     "vhostroot" => "/var/www/html", "vhostport" => 80 }
default["vhost"]["domains"]["gingerbot.com"]             = { "vhostname" => "gingerbot.com",             "vhostadmin" => "hostmaster@technerdia.com",    "vhostroot" => "/var/www/html", "vhostport" => 80 }
default["vhost"]["domains"]["innersoultech.com"]         = { "vhostname" => "innersoultech.com",         "vhostadmin" => "hostmaster@innersoultech.com", "vhostroot" => "/var/www/html", "vhostport" => 80 }
default["vhost"]["domains"]["innersoultechnologies.com"] = { "vhostname" => "innersoultechnologies.com", "vhostadmin" => "hostmaster@innersoultech.com", "vhostroot" => "/var/www/html", "vhostport" => 80 }
default["vhost"]["domains"]["madmadder.com"]             = { "vhostname" => "madmadder.com",             "vhostadmin" => "hostmaster@madmadder.com",     "vhostroot" => "/var/www/html", "vhostport" => 80 }
default["vhost"]["domains"]["demo.technerdia.com"]       = { "vhostname" => "demo.technerdia.com",       "vhostadmin" => "hostmaster@technerdia.com",    "vhostroot" => "/var/www/html", "vhostport" => 80 }
default["vhost"]["domains"]["msrtm.technerdia.com"]      = { "vhostname" => "msrtm.technerdia.com",      "vhostadmin" => "hostmaster@technerdia.com",    "vhostroot" => "/var/www/html", "vhostport" => 80 }
default["vhost"]["domains"]["tucsongolfinfo.com"]        = { "vhostname" => "tucsongolfinfo.com",        "vhostadmin" => "hostmaster@technerdia.com",    "vhostroot" => "/var/www/html", "vhostport" => 80 }
default["vhost"]["domains"]["wearentchefs.com"]          = { "vhostname" => "wearentchefs.com",          "vhostadmin" => "hostmaster@technerdia.com",    "vhostroot" => "/var/www/html", "vhostport" => 80 }
default["vhost"]["domains"]["unicorn.buzz"]              = { "vhostname" => "unicorn.buzz",              "vhostadmin" => "hostmaster@technerdia.com",    "vhostroot" => "/var/www/html", "vhostport" => 80 }

