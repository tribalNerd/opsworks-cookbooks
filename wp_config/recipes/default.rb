#
# Cookbook Name:: wp_config
# Recipe:: wp_config::default
# About:: Deploy wp_config.php
#

# Create Maintenance File If Not Found
template "#{node[:wordpress][:path]}/maintenance.html" do
    source "maintenance.erb"
    only_if do
        File.exists?("#{node[:wordpress][:path]}/maintenance.html")
    end
end

# Delete Current wp-config.php If Found
file "#{node[:wordpress][:path]}/wp-config.php" do
    action :delete
    backup false
    only_if do
        File.exists?("#{node[:wordpress][:path]}/wp-config.php")
    end
end

# Create wp-config.php File From Template
template "#{node[:wordpress][:path]}/wp-config.php" do
    source "wp-config.php.erb"
    mode 0640
    owner 'root'
    group 'root'
    variables(
        :db_name            => node[:wordpress][:name],
        :db_user            => node[:wordpress][:user],
        :db_pass            => node[:wordpress][:pass],
        :db_host            => node[:wordpress][:host],
        :db_prfx            => node[:wordpress][:prfx],
        :language           => node[:wordpress][:lang],
        :auth_key           => node[:wordpress][:auth_key],
        :secure_auth_key    => node[:wordpress][:secure_auth_key],
        :logged_in_key      => node[:wordpress][:logged_in_key],
        :nonce_key          => node[:wordpress][:nonce_key],
        :auth_salt          => node[:wordpress][:auth_salt],
        :secure_auth_salt   => node[:wordpress][:secure_auth_salt],
        :logged_in_salt     => node[:wordpress][:logged_in_salt],
        :nonce_salt         => node[:wordpress][:nonce_salt],
        :wp_cache           => node[:wordpress][:wp_cache],
        :wp_auto_repair     => node[:wordpress][:wp_auto_repair],
        :wp_memory_limit    => node[:wordpress][:wp_memory_limit],
        :disable_wp_cron    => node[:wordpress][:disable_wp_cron],
        :disable_file_edit  => node[:wordpress][:disable_file_edit],
        :force_ssl_login    => node[:wordpress][:force_ssl_login],
        :setup_multisite    => node[:wordpress][:setup_multisite],
        :network_enabled    => node[:wordpress][:network_enabled],
        :aws_keys           => node[:wordpress][:aws_keys],
        :aws_access_key     => node[:wordpress][:aws_access_key],
        :aws_secrets_key    => node[:wordpress][:aws_secrets_key],
        :ms_lockdown        => node[:wordpress][:ms_lockdown],
        :mslock_down_key    => node[:wordpress][:mslock_down_key],
        :mutlsite_domain    => node[:wordpress][:mutlsite_domain]
    )
end

# Delete maintenance.html If Found
file "#{node[:wordpress][:path]}/maintenance.html" do
    action :delete
    backup false
    only_if do
        File.exists?("#{node[:wordpress][:path]}/maintenance.html")
    end
end
