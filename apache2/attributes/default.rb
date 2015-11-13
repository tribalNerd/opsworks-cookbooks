#
# Cookbook Name:: apache2
# Recipe:: default
# About:: Default Apache2 VirutalHost Stack
#

#
# VirtualHost File To Create & Path To Apache
#
default['apache2']['name'] = "websites.conf"
default['apache2']['path'] = "/etc/httpd/conf.d/"
