#
# Cookbook Name:: editor
# Recipe:: editor::default
# About:: Set Default Editor
#

# Set Editor
bash 'set_editor' do
    code <<-EOH
        cd /usr/bin
        sudo ln -s nano node['editor']['type']
        export EDITOR="#{node['editor']['type']}"
    EOH
end
