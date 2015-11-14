#
# Cookbook Name:: virtualhost
# Recipe:: virtualhost::default
# About:: Create VirtualHost Config File For Websites
#

# Create VirtualHost From: templates/default
node[:deploy].each do |app_name, deploy|
    template "/etc/httpd/conf.d/web_apps.conf" do
        source "web_apps.conf.erb"
        owner 'root'
        group 'root'
        mode 0644
        variables(
            :domain => (deploy[:web_apps][:domain] rescue nil),
            :admin => (deploy[:web_apps][:admin] rescue nil),
            :root => (deploy[:web_apps][:root] rescue nil)
       )
    end
end

# Restart Apache
service "httpd" do
    action :restart
end