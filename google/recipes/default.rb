#
# Cookbook Name:: google
# Recipe:: google::default
# About:: Create Google Verify Files
#

# Create Verify Files
node["google_verify"].each do |filename|
    execute "google" do
        command "echo 'google-site-verification: #{filename}.html' > /var/www/html/#{filename}.html"
        action :run
        block do
            ::File.exists?("/var/www/html/#{filename}.html")
        end
    end
end