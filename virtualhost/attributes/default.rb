#
# Cookbook Name:: virtualhost
# Recipe:: default
# About:: Defined Settings
#

#
# VirtualHost File To Create & Path To Apache
#
default['virtualhost']['file'] = "websites.conf"
default['virtualhost']['path'] = "/etc/httpd/conf.d/"
