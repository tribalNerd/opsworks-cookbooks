#
# Cookbook Name:: virtualhost
# Recipe:: virtualhost::default
# About:: Create VirtualHost Config File For Websites
#

# Create VirtualHost From: templates/default
template "/etc/httpd/conf.d/web_apps.conf" do
    source "web_apps.conf.erb"
    owner 'root'
    group 'root'
    mode 0644
end

# Restart Apache
service "httpd" do
    action :restart
end