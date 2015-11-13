#
# Cookbook Name:: memcached
# Recipe:: default
# About:: Install & Start Memcached
#

# Check If PHP Available Before Continuing
if deploy[:application_type] != 'php'
    Chef::Log.info("PHP Not Found: Skipping memcached::default")
    next
end

# Install Memcached
execute "install memcached" do
    command "yum install memcached -y"
    action :run
end

# Start Memcached
service "memcached" do
    action :start
end

# Start Memcached on Reboot
bash "memcached_level" do
    user "root"
    code <<-EOH
        sudo chkconfig --level 345 memcached on
    EOH
end

# Install Libmemcached Library
execute "install php55-pecl-memcache" do
    command "yum install php55-pecl-memcache -y"
    action :run
end