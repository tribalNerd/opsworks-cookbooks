#
# Cookbook Name:: apache2
# Recipe:: deploy
# About:: Deploy Apache VirtualHost
#

# Check If PHP Available Before Continuing
if deploy[:application_type] != 'php'
    Chef::Log.info("PHP Not Found: Skipping apache2::deploy")
    next
end

# Setup VirtualHost File
template "#{node['apache2']['path']}/#{node['apache2']['name']}" do
    source "apache2.conf.erb"
    mode 0644
    owner 'root'
    group 'root'
end

# Restart Apache
service "apache2" do
    action :restart
end