#
# Cookbook Name:: virtualhost
# Recipe:: virtualhost::default
# About:: Create VirtualHost Config File For Websites
#

# Create VirtualHost From: templates/default
template "/etc/httpd/conf.d/web_apps.conf" do
    source "web_apps.conf.erb"
    mode 0644
    owner 'root'
    group 'root'
    variables(
        :domain => node[:web_apps][:website][:domain],
        :admin => node[:web_apps][:website][:admin],
        :root => node[:web_apps][:website][:root]
    )
end

# Restart Apache
service "httpd" do
    action :restart
end