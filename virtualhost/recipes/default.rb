#
# Cookbook Name:: virtualhost
# Recipe:: virtualhost::default
# About:: Create VirtualHost Config File For Websites
#

# Create VirtualHost From: templates/default
node[:web_apps][:domains].each do |domain, admin, root|
    template "/etc/httpd/conf.d/web_apps.conf" do
        source "web_apps.conf.erb"
        owner 'root'
        group 'root'
        mode 0644
        variables(
            :domain => domain,
            :admin => admin,
            :root => root
       )
    end
end

# Restart Apache
service "httpd" do
    action :restart
end