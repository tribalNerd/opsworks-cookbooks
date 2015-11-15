#
# Cookbook Name:: virtualhost
# Recipe:: virtualhost::default
# About:: Create VirtualHost Config File For Websites
#

# Loop Through Settings: attributes/default.rb
node["vhost"]["domains"].each do |application, data|
    # Remove Symlink From Enabled Sites
    link "#{node[:apache][:dir]}/sites-enabled/#{application}.conf" do
        action :delete
        only_if do
            ::File.exists?("#{node[:apache][:dir]}/sites-enabled/#{application}.conf")
        end
    end

    # Remove Config From Available Sites
    file "#{node[:apache][:dir]}/sites-available/#{application}.conf" do
        action :delete
        only_if do
            ::File.exists?("#{node[:apache][:dir]}/sites-available/#{application}.conf")
        end
    end

    # Create VirtualHost From: templates/default
    template "#{node[:apache][:dir]}/sites-available/#{application}.conf" do
        Chef::Log.debug("Generating Apache Configuration For: #{application}")
        source "application.conf.erb"
        owner 'root'
        group 'root'
        mode 0644
        variables(
            :vhostport   => data["vhostport"],
            :vhostdomain => data["vhostname"],
            :vhostroot   => data["vhostroot"],
            :vhostadmin  => data["vhostadmin"]
        ),
        notifies :reload, "service[apache2]", :delayed
    end
end

# Restart Apache
#service "httpd" do
#    action :restart
#end