#
# Cookbook Name:: wp_owner
# Recipe:: wp_owner::default
# About:: Set Permissions & Ownership for Wordpress
#

# Set Permissions & Ownership
bash 'set permissions' do
    code <<-EOH
        # Set Directory Permissions
        find #{node[:app_root]}/ -type d -exec chmod 755 {} \;

        # Set File Permissions
        find #{node[:app_root]}/ -type f -exec chmod 644 {} \;

        # Stop Wordpress From Updating Itself
        chown -R root.root #{node[:app_root]}/

        # Allow Apache To Write To Cache Directory
        chown -R #{node[:wp_config][:owner]} #{node[:app_root]}/wp-content/cache

        # Allow Apache To Write To Uploads Directory
        chown -R #{node[:wp_config][:owner]} #{node[:app_root]}/wp-content/uploads

        # Stop Wordpress From Updating Themes
        chown -R root #{node[:app_root]}/wp-content/themes
        chown -R root #{node[:app_root]}/wp-content/plugins
    EOH
end