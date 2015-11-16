#
# Cookbook Name:: virtualhost
# Recipe:: virtualhost::default
# About:: Create VirtualHost Config File For Websites
#

# Loop Through Settings: attributes/default.rb
node[:vhost][:domains].each do |application, data|
    # Remove Config If Found
    file "#{node[:vhost][:conf]}/#{application}.conf" do
        action :delete
        only_if do
            ::File.exists?("#{node[:vhost][:conf]}/#{application}.conf")
        end
    end

    # Create VirtualHost From: templates/default
    template "#{node[:vhost][:conf]}/#{application}.conf" do
        source "application.conf.erb"
        owner 'root'
        group 'root'
        mode 0644
        variables(
            :vhostport   => data["vhostport"],
            :vhostdomain => data["vhostname"],
            :vhostadmin  => data["vhostadmin"]
            :vhostroot   => data["vhostroot"]
        )
    end
end

# Restart Apache
service "httpd" do
    action :restart
end