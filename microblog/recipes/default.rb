#
# Cookbook Name:: microblog
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

docker_service 'default' do
	action [:create,:start]
end

docker_image 'beylistan/microblog:latest' do
	action :pull
end

