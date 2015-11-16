#
# Cookbook Name:: wp_config
# Recipe:: wp_config::default
# About:: Deploy wp_config.php
#

# Create Maintenance File If Not Found
template "#{node[:wp_config][:path]}/maintenance.html" do
    source "maintenance.erb"
    mode "0755"
end

# Delete Current wp-config.php If Found
file "#{node[:wp_config][:path]}/wp-config.php" do
    action :delete
    backup false
    only_if do
        File.exists?("#{node[:wp_config][:path]}/wp-config.php")
    end
end

# Apache File Ownership Variable
if platform?("ubuntu")
    httpuser = "www-data"
elsif platform?("amazon")
    httpuser = "apache"
end

# Create wp-config.php File From Template
template "#{node[:wp_config][:path]}/wp-config.php" do
    source "wp-config.php.erb"
    mode 0640
    owner 'root'
    group httpuser
end

# Delete Garbage wp-config-sample.php If Found
file "#{node[:wp_config][:path]}/wp-config-sample.php" do
    action :delete
    backup false
    only_if do
        File.exists?("#{node[:wp_config][:path]}/wp-config-sample.php")
    end
end

# Delete maintenance.html If Found
file "#{node[:wp_config][:path]}/maintenance.html" do
    action :delete
    backup false
    only_if do
        File.exists?("#{node[:wp_config][:path]}/maintenance.html")
    end
end
