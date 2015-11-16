#
# Cookbook Name:: wp_config
# Recipe:: wp_config::default
# About:: Deploy & Setup wp_config.php
#

# Create Maintenance File If Not Found
template "#{node[:app_root]}/maintenance.html" do
    source "maintenance.erb"
    mode "0755"
end

# Delete Current wp-config.php If Found
file "#{node[:app_root]}/wp-config.php" do
    action :delete
    backup false
    only_if do
        File.exists?("#{node[:app_root]}/wp-config.php")
    end
end

# Create wp-config.php File From Template
template "#{node[:app_root]}/wp-config.php" do
    source "wp-config.php.erb"
    mode 0640
    owner 'deploy'
    group 'apache'
end

# Delete Garbage wp-config-sample.php If Found
file "#{node[:app_root]}/wp-config-sample.php" do
    action :delete
    backup false
    only_if do
        File.exists?("#{node[:app_root]}/wp-config-sample.php")
    end
end

# Delete maintenance.html If Found
file "#{node[:app_root]}/maintenance.html" do
    action :delete
    backup false
    only_if do
        File.exists?("#{node[:app_root]}/maintenance.html")
    end
end
