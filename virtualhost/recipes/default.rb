#
# Cookbook Name:: virtualhost
# Recipe:: virtualhost::default
# About:: Create VirtualHost Config File For Websites
#

# Loop Through Settings: attributes/default.rb
node[:virutalhost].each do |domain, data|
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
            :email  => data["email"],
            :path   => data["path"]
        )
    end
end

# Remove Default HTML Directory
directory "/var/www/html" do
  action :delete
  not_if { File.symlink?("/var/www/html") }
end

# Symlink Default HTML To Application Source
execute "symlinking app source directory if necessary" do
    command "ln -s #{node[:app_root]} /var/www/html}"
    action :run
    not_if { File.symlink?("/var/www/html") }
end

# Restart Apache
service "httpd" do
    action :restart
end