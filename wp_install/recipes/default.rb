#
# Cookbook Name:: wp_install
# Recipe:: wp_install::default
# About:: Download & Install Latest Wordpress
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
template "#{node[:app_root]}/maintenance.html" do
    source "maintenance.erb"
    mode "0755"
end

# Extract Wordpress
bash "extract wordpress to #{node[:app_root]}/" do
    code <<-EOH
        tmpdir="$(mktemp -d)"
        cd $tmpdir
        tar xzf #{wp_tarball}
        cp -R --no-clobber wordpress/* #{node[:app_root]}/
        rm -Rf $tmpdir
    EOH
end

# Set Permissions & Ownership
bash 'set permissions' do
    code <<-EOH
        # Set Directory Permissions
        find #{node[:app_root]}/ -type d -exec chmod 755 {} \;

        # Set File Permissions
        find #{node[:app_root]}/ -type f -exec chmod 644 {} \;

        # Stop Wordpress From Updating Itself
        chown -R root.root #{node[:app_root]}/

        # Allow Apache To Write To Content Directory
        chown -R #{node[:wordpress][:owner]} #{node[:app_root]}/wp-content/

        # Stop Wordpress From Updating Themes
        chown -R root #{node[:app_root]}/wp-content/themes
        chown -R root #{node[:app_root]}/wp-content/plugins
    EOH
end

#
# Cleanup Duty
#

# Setup .htaccess File
template "#{node[:app_root]}/.htaccess" do
    source "htaccess.erb"
    mode 0660
    owner 'root'
    group #{node[:wordpress][:owner]}
end

# Delete license.txt File If Found
file "#{node[:app_root]}/license.txt" do
    action :delete
    backup false
    only_if do
        File.exists?("#{node[:app_root]}/license.txt")
    end
end

# Delete readme.html File If Found
file "#{node[:app_root]}/readme.html" do
    action :delete
    backup false
    only_if do
        File.exists?("#{node[:app_root]}/readme.html")
    end
end

# Delete wp-config-sample.php File If Found
file "#{node[:app_root]}/wp-config-sample.php" do
    action :delete
    backup false
    only_if do
        File.exists?("#{node[:app_root]}/wp-config-sample.php")
    end
end

# Delete index.html File If Found
file "#{node[:app_root]}/index.html" do
    action :delete
    backup false
    only_if do
        File.exists?("#{node[:app_root]}/index.html")
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
