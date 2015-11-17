#
# Cookbook Name:: virtualhost
# Recipe:: virtualhost::default
# About:: Create VirtualHost Config File For Websites
#

# Loop Through Settings: attributes/default.rb
node[:virutalhost].each do |domain, data|
    # Remove Config If Found
    file "#{node[:httpd_home]}/sites-available/#{domain}.conf" do
        action :delete
        only_if do
            ::File.exists?("#{node[:httpd_home]}/sites-available/#{domain}.conf")
        end
    end

    # Create VirtualHost From: templates/default
    template "#{node[:httpd_home]}/sites-available/#{domain}.conf" do
        source "virtualhost.conf.erb"
        owner 'root'
        group 'root'
        mode '640'
        variables(
            :port   => data["port"],
            :domain => domain,
            :email  => data["email"],
            :path   => data["path"]
        )
    end

    # Symlink Available Sites
    link "#{node[:httpd_home]}/sites-enabled/#{domain}.conf" do
      to "#{node[:httpd_home]}/sites-available/#{domain}.conf"
    end
end

# Restart Apache
service "httpd" do
    action :restart
end