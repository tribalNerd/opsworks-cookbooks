#
# Cookbook Name:: virtualhost
# Recipe:: virtualhost::default
# About:: Create VirtualHost Config File For Websites
#

# Create VirtualHost From: templates/default
hosts = search(:node, "*:*")
#node[:vhost].each do |key,value|
    template "/etc/httpd/conf.d/web_apps.conf" do
        source "web_apps.conf.erb"
        owner 'root'
        group 'root'
        mode 0644
        variables(
            :hosts  => hosts;
            :domain => node[:domain],
            :admin  => node[:admin],
            :root   => node[:root]
       )
    end
#end

# Restart Apache
#service "httpd" do
#    action :restart
#end