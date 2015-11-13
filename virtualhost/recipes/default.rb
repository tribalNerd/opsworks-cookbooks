#
# Cookbook Name:: virtualhost
# Recipe:: virtualhost::default
# About:: Create VirtualHost Config File For Websites
#

# Create VirtualHost From: templates/default
template "/etc/httpd/conf.d/websites.conf" do
    source "virtualhost.conf.erb"
    mode 0644
    owner 'root'
    group 'root'
    variables(
        :domain => node[:virutalhost][:websites][:domain] rescue nil,
        :root   => node[:virutalhost][:websites][:root] rescue nil,
        :admin  => node[:virutalhost][:websites][:admin] rescue nil,
    )
end

# Restart Apache
service "httpd" do
    action :restart
end