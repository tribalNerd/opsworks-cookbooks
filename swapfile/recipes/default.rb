#
# Cookbook Name:: swapfile
# Recipe:: swapfile::default
# About:: Create Memory Swapfile For Ec2 Instances
#

# Setup Swapfile
execute "swapfile" do
    command "sudo dd if=/dev/zero of=/swapfile bs=1M count=1024; sudo mkswap /swapfile; sudo swapon /swapfile;"
    action :run
end