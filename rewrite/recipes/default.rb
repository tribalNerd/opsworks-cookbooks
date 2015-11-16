#
# Cookbook Name:: rewrite
# Recipe:: rewrite::default
# About:: Enable Mod Rewrite For Apache
#

# Enable Mod Rewrite
execute "a2dismod rewrite" do
    command "/usr/sbin/a2dismod rewrite"
end

# Restart Apache
service "httpd" do
    action :restart
end