#
# Cookbook Name:: microblog
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package 'docker'

service 'docker' do
	action [:start, :enable]
end

template '/etc/systemd/system/microblog.service' do
	source 'microblog.service'
	mode '0644'
	notifies :run, 'execute[reloadsystemd]'
end

execute 'reloadsystemd' do
  command '/bin/systemctl daemon-reload'
  action :nothing
end

execute "repull-docker-image" do
  command "/bin/docker pull beylistan/microblog:latest"
  notifies :restart, 'service[microblog]'
end

service 'microblog' do
	action [:start, :enable]
end
