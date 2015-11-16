#
# Cookbook Name:: wp_owner
# Recipe:: wp_owner::default
# About:: Set Permissions & Ownership for Wordpress
#

# Set Permissions & Ownership
bash 'set permissions' do
    code <<-EOH
        # Set Directory Permissions
        sudo find #{node[:app_root]}/ -type d -exec chmod 755 {} \;

        # Set File Permissions
        sudo find #{node[:app_root]}/ -type f -exec chmod 644 {} \;

        # Allow Apache To Write To Cache Directory
        sudo chown -R #{node[:wp_config][:owner]}:#{node[:wp_config][:owner]} #{node[:app_root]}/wp-content/cache

        # Allow Apache To Write To Uploads Directory
        sudo chown -R #{node[:wp_config][:owner]}:#{node[:wp_config][:owner]} #{node[:app_root]}/wp-content/uploads

        # Allow Apache To Write To w3tc-config Directory
        sudo chown -R #{node[:wp_config][:owner]}:#{node[:wp_config][:owner]} #{node[:app_root]}/wp-content/w3tc-config
    EOH
end