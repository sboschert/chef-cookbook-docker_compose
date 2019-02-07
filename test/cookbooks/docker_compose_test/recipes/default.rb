#
# Cookbook Name:: docker_compose_test
# Recipe:: default
#
# Copyright (c) 2016 Sebastian Boschert, All Rights Reserved.

include_recipe 'docker_compose_test::installation'
include_recipe 'docker_compose_test::application_up'
include_recipe 'docker_compose_test::application_up_remove_orphans'
include_recipe 'docker_compose_test::application_build'
