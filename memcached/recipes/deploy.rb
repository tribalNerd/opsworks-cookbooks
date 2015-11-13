#
# Cookbook Name:: memcached
# Recipe:: deploy
# About:: Install & Start Memcached
#

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