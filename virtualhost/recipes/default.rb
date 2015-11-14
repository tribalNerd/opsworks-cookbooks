#
# Cookbook Name:: virtualhost
# Recipe:: virtualhost::default
# About:: Create VirtualHost Config File For Websites
#

# Create VirtualHost From: templates/default
node[:vhost][:domain].each do |host|
    template "/etc/httpd/conf.d/#{node[:vhost][:domain]}.conf" do
        source "#{node[:vhost][:tmpl]}"
        owner 'root'
        group 'root'
        mode 0644
        variables(
            :domain => node[:vhost][:domain],
            :admin => node[:vhost][:admin],
            :root => node[:vhost][:root]
       )
    end
end

# Restart Apache
#service "httpd" do
#    action :restart
#end