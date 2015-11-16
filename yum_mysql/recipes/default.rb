#
# Cookbook Name:: yum_mysql
# Recipe:: yum_mysql::default
# About:: Required For Wordpress
#

# Install
execute "install php-mysql php-pdo" do
    command "yum install php-mysql php-pdo -y"
    action :run
end