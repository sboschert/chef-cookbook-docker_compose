#
# Cookbook Name:: docker_compose_test
# Recipe:: project_up
#
# Copyright (c) 2016 Sebastian Boschert, All Rights Reserved.

cookbook_file 'compose_build_1.yml' do
  action :create
  path '/etc/docker-compose/docker-compose_build.yml'
  source 'docker-compose_build_1.yml'
  owner 'root'
  group 'root'
  mode 0640
  notifies :up, 'docker_compose_application[builtapp]', :immediate
end

docker_compose_application 'builtapp' do
  action :up
  compose_files [ '/etc/docker-compose/docker-compose_build.yml' ]
end

directory '/etc/docker-compose/nginx_custom' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

cookbook_file '/etc/docker-compose/nginx_custom/Dockerfile' do
  source 'Dockerfile.nginx_custom'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

cookbook_file 'compose_build_2.yml' do
  path '/etc/docker-compose/docker-compose_build.yml'
  source 'docker-compose_build_2.yml'
  owner 'root'
  group 'root'
  mode 0640
  notifies :restart, 'docker_compose_application[builtapp]', :immediate
end
