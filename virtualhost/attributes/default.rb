#
# Cookbook Name:: virtualhost
# Recipe:: virtualhost::default
# About:: Default Settings
#

#
# Full Path to VirtualHost File To Create
# Use: #{node[:vhost][:conf]}

default[:vhost][:conf] = "/etc/httpd/conf.d/web_apps.conf"