#
# Cookbook Name:: virtualhost
# Recipe:: virtualhost::default
# About:: Default Settings
#

#
# VirtualHost File To Create & Path To Apache
#   #{node[:vhost][:conf]}
#   #{node[:vhost][:path]}
#   #{node[:vhost][:tmpl]}

default[:vhost][:file] = "web_apps.conf"
default[:vhost][:path] = "/etc/httpd/conf.d/"
default[:vhost][:tmpl] = "web_apps.conf.erb"