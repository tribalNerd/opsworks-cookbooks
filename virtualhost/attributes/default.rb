#
# Cookbook Name:: virtualhost
# Recipe:: virtualhost::default
# About:: Default Settings
#

#
# Full Path to VirtualHost File To Create
# Use: #{node[:vhost][:conf]}
#

#default[:vhost][:conf] = "/etc/httpd/conf.d"


#
# Virtual Host Template To Use
# Use: #{node[:vhost][:tmpl]}
#

#default[:vhost][:tmpl] = "web_apps.conf.erb"


#
# Virtual Host Records
# Use: #{node[:vhost][:tmpl]}
#
default["vhost"]["domains"]["hive.madmadder.com"] = { "port" => 80, "servername" => "hive.madmadder.com", "serveradmin" => "hostmaster@madmadder.com", "serverroot" => "/var/www/html" }
default["vhost"]["domains"]["gingerbot.com"] = { "port" => 80, "servername" => "gingerbot.com", "serveradmin" => "hostmaster@technerdia.com", "serverroot" => "/var/www/html" }
default["vhost"]["domains"]["innersoultech.com"] = { "port" => 80, "servername" => "innersoultech.com", "serveradmin" => "hostmaster@innersoultech.com", "serverroot" => "/var/www/html" }
default["vhost"]["domains"]["innersoultechnologies.com"] = { "port" => 80, "servername" => "innersoultechnologies.com", "serveradmin" => "hostmaster@innersoultech.com", "serverroot" => "/var/www/html" }
default["vhost"]["domains"]["madmadder.com"] = { "port" => 80, "servername" => "madmadder.com", "serveradmin" => "hostmaster@madmadder.com", "serverroot" => "/var/www/html" }
default["vhost"]["domains"]["demo.technerdia.com"] = { "port" => 80, "servername" => "demo.technerdia.com", "serveradmin" => "hostmaster@technerdia.com", "serverroot" => "/var/www/html" }
default["vhost"]["domains"]["msrtm.technerdia.com"] = { "port" => 80, "servername" => "msrtm.technerdia.com", "serveradmin" => "hostmaster@technerdia.com", "serverroot" => "/var/www/html" }
default["vhost"]["domains"]["tucsongolfinfo.com"] = { "port" => 80, "servername" => "tucsongolfinfo.com", "serveradmin" => "hostmaster@technerdia.com", "serverroot" => "/var/www/html" }
default["vhost"]["domains"]["wearentchefs.com"] = { "port" => 80, "servername" => "wearentchefs.com", "serveradmin" => "hostmaster@technerdia.com", "serverroot" => "/var/www/html" }
default["vhost"]["domains"]["unicorn.buzz"] = { "port" => 80, "servername" => "unicorn.buzz", "serveradmin" => "hostmaster@technerdia.com", "serverroot" => "/var/www/html" }
