#
# Cookbook Name:: wordpress
# Recipe:: wordpress::default
# About:: Deploy Wordpress Recipe
#

require 'uri'
require 'net/http'
require 'net/https'

# Deploy Wordpress


    # Where To Store Download
    wp_tarball = "/usr/src/wordpress.tar.gz"

    # Download Wordpress
    remote_file 'fetch Wordpress tarball' do
        action :create_if_missing
        source node[:wordpress][:latest]
        path wp_tarball
        mode 0644
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

    # Download & Extract Plugins
#    node['wordpress']['plugins'].each do |plugin|

#        plugin_name = plugin[:name]

        # Download Plugin
#        remote_file "/usr/src/plugin_#{plugin_name}.zip" do
#            action :create_if_missing
#            source plugin[:latest]
#        end

        # Extract Plugin
#        execute "extract plugin #{plugin_name} to #{deploy[:deploy_to]}/current" do
#            command "unzip -o /usr/src/plugin_#{plugin_name}.zip"
#            cwd "#{node[:wordpress][:path]}/wp-content/plugins"
#        end

#    end

    # Apache File Ownership Variable
    if platform?("ubuntu")
        httpuser = "www-data"
    elsif platform?("amazon")
        httpuser = "apache"
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
            chown -R #{httpuser} #{node[:wordpress][:path]}/wp-content/

            # Stop Wordpress From Updating Themes
            chown -R root #{node[:wordpress][:path]}/wp-content/themes
            chown -R root #{node[:wordpress][:path]}/wp-content/plugins
        EOH
    end

    # Get Wordpress Salts For wp-config.php
#    uri = URI.parse("https://api.wordpress.org/secret-key/1.1/salt/")
#    http = Net::HTTP.new(uri.host, uri.port)
#    http.use_ssl = true
#    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
#    request = Net::HTTP::Get.new(uri.request_uri)
#    response = http.request(request)
#    keys = response.body

    # Database Variables: Stack Database or External Database Information
#    if node[:wordpress][:use_stack_database]
        # Database Stack Layer
#        Chef::Log.info('Using Stack Database')
#        db_name = deploy[:database][:database] rescue nil
#        db_user =  deploy[:database][:username] rescue nil
#        db_password = deploy[:database][:password] rescue nil
#        db_host = deploy[:database][:host] rescue nil
#    else
        # External DB - Settings Via JSON
#        Chef::Log.info('Using External Database')
#        db_name = node[:wordpress][:db_name] rescue nil
#        db_user = node[:wordpress][:db_user] rescue nil
#        db_password = node[:wordpress][:db_pass] rescue nil
#        db_host = node[:wordpress][:db_host] rescue nil
#    end

    # Error Checking
#    raise 'Database Name Is Missing.' if db_name.empty?
#    raise 'Database Username Is Missing.' if db_user.empty?
#    raise 'Database Password Is Missing.' if db_password.empty?
#    raise 'Database Host Name Is Missing.' if db_host.empty?

    # No Errors, Log Success
#    Chef::Log.info("Database Found: #{db_host}")


    # Setup wp-config.php File
    template "#{node[:wordpress][:path]}/wp-config.php" do
        source "wp-config.php.erb"
        mode 0640
        owner 'root'
        group httpuser
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

#    # Setup .htaccess File
    template "#{node[:wordpress][:path]}/.htaccess" do
        source "htaccess.erb"
        mode 0660
        owner 'root'
        group httpuser
    end

    # Delete license.txt File
    file "#{node[:wordpress][:path]}/license.txt" do
        action :delete
        backup false
        only_if do
            File.exists?("#{node[:wordpress][:path]}/license.txt")
        end
    end

    # Delete readme.html File
    file "#{node[:wordpress][:path]}/readme.html" do
        action :delete
        backup false
        only_if do
            File.exists?("#{node[:wordpress][:path]}/readme.html")
        end
    end

    file "#{node[:wordpress][:path]}/index.html" do
        action :delete
        backup false
        only_if do
            File.exists?("#{node[:wordpress][:path]}/index.html")
        end
    end

    # Loopback Cron: Ensures Scheduled Content Is Posted If Not Posted
#    cron 'wordpress' do
#        hour '*'
#        minute '*/15'
#        weekday '*'
#        command "wget -q -O - http://#{deploy[:domains].first}/wp-cron.php?doing_wp_cron >/dev/null 2>&1"
#    end
