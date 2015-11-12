#
# Cookbook Name:: wordpress
# Recipe:: deploy
# About:: Deploy Wordpress Recipe
#

require 'uri'
require 'net/http'
require 'net/https'

# Check If PHP Available Before Continuing
if deploy[:application_type] != 'php'
    Chef::Log.info("PHP Not Found: Skipping wordpress::deploy")
    next
end

# Deploy Wordpress
node[:deploy].each do |app_name, deploy|

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
    bash "extract wordpress to #{deploy[:deploy_to]}/current" do
        code <<-EOH
            tmpdir="$(mktemp -d)"
            cd $tmpdir
            tar xzf #{wp_tarball}
            cp -R --no-clobber wordpress/* #{deploy[:deploy_to]}/current
            rm -Rf $tmpdir
        EOH
    end

    # Download & Extract Plugins
    node['wordpress']['plugins'].each do |plugin|

        plugin_name = plugin[:name]

        # Download Plugin
        remote_file "/usr/src/plugin_#{plugin_name}.zip" do
            action :create_if_missing
            source plugin[:latest]
        end

        # Extract Plugin
        execute "extract plugin #{plugin_name} to #{deploy[:deploy_to]}/current" do
            command "unzip -o /usr/src/plugin_#{plugin_name}.zip"
            cwd "#{deploy[:deploy_to]}/current/wp-content/plugins"
        end

    end

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
            find #{deploy[:deploy_to]}/current/ -type d -exec chmod 755 {} \;

            # Set File Permissions
            find #{deploy[:deploy_to]}/current/ -type f -exec chmod 644 {} \;

            # Stop Wordpress From Updating Itself
            chown -R root.root #{deploy[:deploy_to]}/current/

            # Allow Apache To Write To Content Directory
            chown -R #{httpuser} #{deploy[:deploy_to]}/current/wp-content/

            # Stop Wordpress From Updating Themes
            chown -R root #{deploy[:deploy_to]}/current/wp-content/themes
            chown -R root #{deploy[:deploy_to]}/current/wp-content/plugins
        EOH
    end

    # Get Wordpress Salts For wp-config.php
    uri = URI.parse("https://api.wordpress.org/secret-key/1.1/salt/")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Get.new(uri.request_uri)
    response = http.request(request)
    keys = response.body

    # Database Variables: Stack Database or External Database Information
    if node[:wordpress][:use_stack_database]
        # Database Stack Layer
        Chef::Log.info('Using Stack Database')
        db_name = deploy[:database][:database] rescue nil
        db_user =  deploy[:database][:username] rescue nil
        db_password = deploy[:database][:password] rescue nil
        db_host = deploy[:database][:host] rescue nil
    else
        # External DB - Settings Via JSON
        Chef::Log.info('Using External Database')
        db_name = node[:wordpress][:db_name] rescue nil
        db_user = node[:wordpress][:db_user] rescue nil
        db_password = node[:wordpress][:db_pass] rescue nil
        db_host = node[:wordpress][:db_host] rescue nil
    end

    # Error Checking
    raise 'Database Name Is Missing.' if db_name.empty?
    raise 'Database Username Is Missing.' if db_user.empty?
    raise 'Database Password Is Missing.' if db_password.empty?
    raise 'Database Host Name Is Missing.' if db_host.empty?

    # No Errors, Log Success
    Chef::Log.info("Database Found: #{db_host}")

    # Setup wp-config.php File
    template "#{deploy[:deploy_to]}/current/wp-config.php" do
        source "wp-config.php.erb"
        mode 0640
        owner 'root'
        group httpuser
        variables(
            :db_name   => db_name,
            :db_user   => db_user,
            :db_pass   => db_pass,
            :db_host   => db_host,
            :keys      => (keys rescue nil)
        )
    end

    # Setup .htaccess File
    template "#{deploy[:deploy_to]}/current/.htaccess" do
        source "htaccess.erb"
        mode 0660
        owner 'root'
        group httpuser
    end

    htaccess_partials = []
    htaccess_partials << {:template => 'htaccess-browsercache.erb', :cookbook => 'w3_total_cache', :variables => {:cache => deploy[:wordpress][:cache]}} if deploy[:wordpress][:cache][:enabled] && deploy[:wordpress][:cache][:browsercache][:enabled]
    htaccess_partials << {:template => 'htaccess-cdn.erb', :cookbook => 'w3_total_cache', :variables => {:cache => deploy[:wordpress][:cache]}} if deploy[:wordpress][:cache][:enabled] && deploy[:wordpress][:cache][:cdn][:enabled]
    template "#{deploy[:deploy_to]}/current/.htaccess" do
    cookbook 'wordpress'
    source 'htaccess.erb'
    mode '0660'
    owner 'root'
    group httpuser

    # Loopback Cron: Ensures Scheduled Content Is Posted If Not Posted
    cron 'wordpress' do
        hour '*'
        minute '*/15'
        weekday '*'
        command "wget -q -O - http://#{deploy[:domains].first}/wp-cron.php?doing_wp_cron >/dev/null 2>&1"
    end

end