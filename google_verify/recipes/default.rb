#
# Cookbook Name:: google_verify
# Recipe:: google_verify::default
# About:: Create Google Verify Files
#

# Create Verify Files
node["google_verify"].each do |filename|
    execute "google" do
        command "echo 'google-site-verification: #{filename}.html' > #{node["app_root"]}/#{filename}.html"
        action :run
        block do
            ::File.exists?("#{node["app_root"]}/#{filename}.html")
        end
    end
end