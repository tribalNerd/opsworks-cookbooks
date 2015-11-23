#
# Cookbook Name:: verify_site
# Recipe:: verify_site::default
# About:: Create Google Verify Files
#

# Create Verify Files
node["verify_site"].each do |filename|
    execute "google" do
        command "echo 'google-site-verification: #{filename}.html' > #{node["app_root"]}/#{filename}.html"
        command "chmod 0755 google-site-verification: #{filename}.html"
        action :run
        only_if do
            !::File.exists?("#{node["app_root"]}/#{filename}.html")
        end
    end
end