#
# Cookbook Name:: virtualhost
# Recipe:: virtualhost::default
# About:: Default Settings
#

#
# Full Path to VirtualHost File To Create
# Use: #{node[:vhost][:conf]}
#

default[:vhost][:conf] = "/etc/httpd/conf.d"


#
# Virtual Host Template To Use
# Use: #{node[:vhost][:tmpl]}
#

default[:vhost][:tmpl] = "web_apps.conf.erb"