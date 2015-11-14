#
# Cookbook Name:: virtualhost
# Recipe:: virtualhost::default
# About:: Create VirtualHost Config File For Websites
#

# Create VirtualHost From: templates/default
node[:vhost].each do |vhostname, data|
    template "/etc/httpd/conf.d/#{vhostname}.conf" do
        source "web_apps.conf.erb"
        owner 'root'
        group 'root'
        mode 0644
        variables(
            :domain => data["domain"]
            :root   => data["root"]
            :admin  => data["admin"]
       )
    end
end

# Restart Apache
#service "httpd" do
#    action :restart
#end