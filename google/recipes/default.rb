#
# Cookbook Name:: google
# Recipe:: google::default
# About:: Create Google Verify Files
#

# Create Verify Files
node["google"].each do |filename|
    execute "google" do
        command "echo '#{filename}' > /var/www/html/#{filename}.html"
        action :run
    end
end