#
# Cookbook Name:: virtualhost
# Recipe:: default
# About:: Add Custom Apache2 VirtualHost
#

# Check If PHP Available Before Continuing
if deploy[:application_type] != 'php'
    Chef::Log.info("PHP Not Found: Skipping virtualhost::deploy")
    next
end

# Setup VirtualHost File
template "#{node['virtualhost']['path']}/#{node['virtualhost']['file']}" do
    source "virtualhost.conf.erb"
    mode 0644
    owner 'root'
    group 'root'
end

# Restart Apache
service "apache2" do
    action :restart
end