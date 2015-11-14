#
# Cookbook Name:: virtualhost
# Recipe:: virtualhost::default
# About:: Create VirtualHost Config File For Websites
#

# Create VirtualHost From: templates/default
node["vhost"]["domains"].each do |sitename, data|
    template "/etc/httpd/conf.d/#{sitename}.conf" do
        source "web_apps.conf.erb"
        owner 'root'
        group 'root'
        mode 0644
        variables(
            :domain => data["servername"],
            :root   => data["serverroot"],
            :admin  => data["serveradmin"]
       )
    end
end

# Restart Apache
#service "httpd" do
#    action :restart
#end