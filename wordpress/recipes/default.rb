#
# Cookbook Name:: wordpress
# Recipe:: wordpress::default
# About:: Deploy Wordpress Recipe
#

require 'uri'
require 'net/http'
require 'net/https'

# Where To Store Download
wp_tarball = "/usr/src/wordpress.tar.gz"

# Download Wordpress
remote_file 'fetch Wordpress tarball' do
    action :create_if_missing
    source node[:wordpress][:latest]
    path wp_tarball
    mode 0644
end

# Create Maintenance File If Not Found
template "#{node[:wordpress][:path]}/maintenance.html" do
    source "maintenance.erb"
    mode "0755"
end

# Extract Wordpress
bash "extract wordpress to #{node[:wordpress][:path]}/" do
    code <<-EOH
        tmpdir="$(mktemp -d)"
        cd $tmpdir
        tar xzf #{wp_tarball}
        cp -R --no-clobber wordpress/* #{node[:wordpress][:path]}/
        rm -Rf $tmpdir
    EOH
end

# Set Permissions & Ownership
bash 'set permissions' do
    code <<-EOH
        # Set Directory Permissions
        find #{node[:wordpress][:path]}/ -type d -exec chmod 755 {} \;

        # Set File Permissions
        find #{node[:wordpress][:path]}/ -type f -exec chmod 644 {} \;

        # Stop Wordpress From Updating Itself
        chown -R root.root #{node[:wordpress][:path]}/

        # Allow Apache To Write To Content Directory
        chown -R #{node[:wordpress][:owner]} #{node[:wordpress][:path]}/wp-content/

        # Stop Wordpress From Updating Themes
        chown -R root #{node[:wordpress][:path]}/wp-content/themes
        chown -R root #{node[:wordpress][:path]}/wp-content/plugins
    EOH
end

#
# Cleanup Duty
#

# Setup .htaccess File
template "#{node[:wordpress][:path]}/.htaccess" do
    source "htaccess.erb"
    mode 0660
    owner 'root'
    group #{node[:wordpress][:owner]}
end

# Delete license.txt File If Found
file "#{node[:wordpress][:path]}/license.txt" do
    action :delete
    backup false
    only_if do
        File.exists?("#{node[:wordpress][:path]}/license.txt")
    end
end

# Delete readme.html File If Found
file "#{node[:wordpress][:path]}/readme.html" do
    action :delete
    backup false
    only_if do
        File.exists?("#{node[:wordpress][:path]}/readme.html")
    end
end

# Delete wp-config-sample.php File If Found
file "#{node[:wordpress][:path]}/wp-config-sample.php" do
    action :delete
    backup false
    only_if do
        File.exists?("#{node[:wordpress][:path]}/wp-config-sample.php")
    end
end

# Delete index.html File If Found
file "#{node[:wordpress][:path]}/index.html" do
    action :delete
    backup false
    only_if do
        File.exists?("#{node[:wordpress][:path]}/index.html")
    end
end

# Delete maintenance.html If Found
file "#{node[:wordpress][:path]}/maintenance.html" do
    action :delete
    backup false
    only_if do
        File.exists?("#{node[:wordpress][:path]}/maintenance.html")
    end
end
