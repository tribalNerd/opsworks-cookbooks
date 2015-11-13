#
# Cookbook Name:: virtualhost
# Recipe:: virtualhost::default
# About:: Create VirtualHost Config File For Websites
#

# Setup VirtualHost File
template "/etc/httpd/conf.d/websites.conf" do
    source "virtualhost.conf.erb"
    mode 0644
    owner 'root'
    group 'root'
end

# Restart Apache
service "apache2" do
    action :restart
end