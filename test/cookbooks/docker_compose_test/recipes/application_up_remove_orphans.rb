#
# Cookbook Name:: docker_compose_test
# Recipe:: project_up
#
# Copyright (c) 2016 Sebastian Boschert, All Rights Reserved.

cookbook_file '/etc/docker-compose/docker-compose_remove_orphans_1.yml' do
  action :create
  source 'docker-compose_remove_orphans_1.yml'
  owner 'root'
  group 'root'
  mode 0640
  notifies :up, 'docker_compose_application[removeorphans1]', :delayed
end

cookbook_file '/etc/docker-compose/docker-compose_remove_orphans_2.yml' do
  action :create
  source 'docker-compose_remove_orphans_2.yml'
  owner 'root'
  group 'root'
  mode 0640
  notifies :up, 'docker_compose_application[removeorphans2]', :delayed
end

docker_compose_application 'removeorphans1' do
  action :up
  compose_files [ '/etc/docker-compose/docker-compose_remove_orphans_1.yml' ]
  project_name 'removeorphans'
end

docker_compose_application 'removeorphans2' do
  action :up
  compose_files [ '/etc/docker-compose/docker-compose_remove_orphans_2.yml' ]
  remove_orphans true
  project_name 'removeorphans'
end
