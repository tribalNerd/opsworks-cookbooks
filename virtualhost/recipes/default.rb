#
# Cookbook Name:: virtualhost
# Recipe:: virtualhost::default
# About:: Create VirtualHost Config File For Websites
#

# Create VirtualHost From: templates/default
node[:vhost].each do |domain, root, admin|
    template "/etc/httpd/conf.d/#{domain}.conf" do
        source "#{node[:vhost][:tmpl]}"
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
#service "httpd" do
#    action :restart
#end