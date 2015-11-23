#
# Cookbook Name:: verify_site
# Recipe:: verify_site::default
# About:: Create Google Verify Files
#

# Create Verify Files - If Not Found
node["verify_site"].each do |filename|
    execute "google" do
        command "echo 'google-site-verification: #{filename}.html' > #{node["app_root"]}/#{filename}.html"
        action :run
        only_if do
            !::File.exists?("#{node["app_root"]}/#{filename}.html")
        end
    end
end

# Chmod Files - If Found
node["verify_site"].each do |filename|
    execute "chmod" do
        command "chmod 0755 #{filename}.html"
        action :run
        only_if do
            ::File.exists?("#{node["app_root"]}/#{filename}.html")
        end
    end
end