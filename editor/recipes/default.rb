#
# Cookbook Name:: editor
# Recipe:: editor::default
# About:: Set Pico As Default Editor
#

# Set Editor
bash 'set_editor' do
    code <<-EOH
        cd /usr/bin
        sudo ln -s nano pico
        export EDITOR="pico"
    EOH
end