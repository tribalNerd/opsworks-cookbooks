#
# Cookbook Name:: virtualhost
# Recipe:: virtualhost::default
# About:: Create VirtualHost Config File For Websites
#

# Loop Through Settings: attributes/default.rb
node[:virutalhosts].each do |domain, data|
    # Remove Config If Found
    file "#{node[:httpd_home]}/#{domain}.conf" do
        action :delete
        only_if do
            ::File.exists?("#{node[:httpd_home]}/#{domain}.conf")
        end
    end

    # Create VirtualHost From: templates/default
    template "#{node[:httpd_home]}/#{domain}.conf" do
        source "virtualhost.conf.erb"
        owner 'root'
        group 'root'
        mode 0644
        variables(
            :port   => data["port"],
            :domain => domain,
            :admin  => data["email"],
            :root   => data["path"]
        )
    end
end

# Restart Apache
service "httpd" do
    action :restart
end