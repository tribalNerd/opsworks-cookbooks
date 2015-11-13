#
# Cookbook Name:: virtualhost
# Recipe:: default
# About:: Add Custom Apache2 VirtualHost
#

# Setup VirtualHost File
template "/etc/httpd/conf.d/websites.conf" do
    source "virtualhost.conf.erb"
    mode 0644
    owner deploy[:user]
    group deploy[:group]
end

# Restart Apache
service "apache2" do
    action :restart
end